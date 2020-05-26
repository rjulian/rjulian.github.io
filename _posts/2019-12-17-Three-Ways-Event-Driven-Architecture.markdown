---
layout: post
description: "Event driven architecture inside of AWS."
title: "Three Ways: Event Driven Architecture"
categories: cloud monitoring
---
*This blog post was co-written with friend and coworker, [Max Anderson](https://mcbanderson.com/).*

As the complexity and scale of our AWS use cases grow, so too does the complexity of  monitoring and managing our AWS accounts. Whether these concerns revolve around maintaining corporate compliance objectives, hardening accounts against attackers, or simply controlling cost, the enforcement mechanisms can involve some serious logic. With the advent of AWS Cloudwatch Events we can leverage a new pattern to easily and cost effectively satisfy these requirements: event driven architecture. The goal of this post is to provide an overview of what event driven architecture is, pose three realistic requirements for an AWS environment, and demonstrate the corresponding event driven solutions to satisfy those requirements.

# What is Event Driven Architecture?

Event driven architecture in AWS is similar to event driven architecture in other contexts, in that our code is triggered by some event occurring, as opposed to being ran once manually or as a result of state pulling. In AWS, this simply means that the mechanism with which our code or systems become triggered is the AWS Events service. What this means, ultimately, is that we’re designing applications that will react to events that happen within our AWS environment: e.g. the creation of an internet gateway, the updating of an auto-scaling launch configuration, or an application emitting a custom event to the CloudWatch Events service.

Leveraging the CloudWatch Events Rule functionality, we can monitor our accounts for the aforementioned events (triggered by API calls) and then forward the matching event payload to one of a number of target services. These target services are where we implement the logic for enforcing our environmental requirements, for example using Lambda to parse an event payload for a specific tag to identify a resource, or sending our event to an SNS topic that will notify a subset of our organization via SMS. Additionally, with the advent of AWS Eventbridge, we can now see seamless event rule target integration with numerous SaaS providers, making it dead simple to connect the spinning up of an offending resource with a PagerDuty notification going out to an engineering team.

# Example Use Cases

The following use cases are some common requirements you’ll encounter in organizations. We’ll briefly cover each use case, then dive into how you can meet each requirement using event driven architecture.

## Sending Notifications

A common requirement in any organization is sending alerts when specific events occur. For example we might want to notify our Network Operations Center any time changes are made to a VPC, or a new VPC is created. This way we can be notified in real time of any important changes being made to our environment.

## Monitoring for Security Events

Another common use case is monitoring our environment for potential security events or violations. For example we might require that all S3 buckets have encryption enabled. Using Event Driven Architecture we can monitor our accounts for new or modified S3 buckets, and enforce this requirement.

## Enforcing Configuration Requirements

Beyond security, organizations can leverage event driven architecture to automatically configure newly launched resources to conform to a certain state. For example, we can mandate that all newly spun up EC2 instances are tagged according to our company’s standards, whether the tags were provided at launch or not.

# Way One: Notify Via Email Anytime A VPC Is Created

**Requirement:** Our resident account administrator needs to be emailed anytime a VPC is created in our account.

As background, let’s pretend we exist in an organization that has agreed that the creation of a VPC should be such a rare enough event that we need to alert an administrator via email anytime one is created. Before the possibility of event driven architecture, an organization would have to regularly poll their environment on an interval to determine whether or not such an event had taken place. Now, we rely on CloudWatch events to look for an event with the API action CreateVpc and then forward the event payload to an SNS topic with our administrator as an email subscriber. For this rather simple solution, we don’t have to manage any Lambda code, and simply spin up the two resources.

![Way One](/images/CWE-SNS-1024x607.png)

{% gist 22089870bf7116187d39aae699ea21f6 %}

To test out this solution, simply change the email address associated with the SNS topic, create the stack, confirm your SNS topic subscription (via the email you received when the stack was created), and then launch a VPC. In moments, you should get an email alerting you to the offending VPC. (Sometimes these emails get sent to spam, so check your spam folder if you don’t see them).


# Way Two: Enforce S3 Bucket Encryption

**Requirement**: Our company requires that all S3 buckets have encryption enabled.

This is a pretty typical requirement for any organization. It is best practice to always encrypt data at rest, especially if there is — or could potentially be — any sensitive data being kept. Because of this, it is best practice to always encrypt your S3 buckets. AWS makes this quite easy to accomplish, so really there is no reason to not just encrypt all of them.

To accomplish this we’re going to monitor two events; the creation of new buckets, and the modification of bucket encryption settings. That way, if someone creates a new bucket, encryption will automatically be turned on, and if someone tries to turn it off on an existing bucket, it will automatically be turned back on. It should be noted, however, that our solution will not automatically turn on encryption for existing unencrypted buckets. There will need to either be a separate script to do that, or, the less appealing option, turn encryption on for existing unencrypted buckets manually.

The following CloudFormation template will create a CloudWatch Event Rule that triggers a Lambda. Whenever an S3 bucket is created or updated, the Lambda will check the configuration of the S3

![Way Two](/images/CWE-Lambda-V2-1024x607.png)

{% gist 173c954b07a20292a4ccad12ccce993f %}

# Way Three: Automatically Configure EC2 Instances After Launch

**Requirement:** As a policy at our company, we want to ensure that all EC2 instances are tagged in a certain way and that the instance is in an “administrator” security group.

For this situation, we’re creating an event rule that is actually supposed to capture what we consider normal activity. In this case, however, we’re simply checking that the EC2 instances that we launch within our account match our business requirements of having a certain set of tags and were configured to include our administrator security group. For simplicity’s sake, we’re just going to set default strings for the tag values and pass in the necessary security group ID as a parameter to the Cloudformation template. In the real world, it’s assumed that there could be quite complex logic to infer tagging values and a security group could be determined based on its tagged name or properties. Additionally, the lambda that we will use to do the evaluation logic will be an inline Lambda, while in a production environment it’s likely this would be a Lambda zip deployed to S3 with all of the accompanying SDLC pieces.

The following Cloudformation template creates a CloudWatch Event Rule that reacts to an EC2 RunInstances API event occurring. After our Event Rule is triggered, we will forward the payload of the event to our Lambda code for processing. This code describes the running instances and checks whether or not the proper tags have been applied to the ec2 instance as well as whether or not our administrator security group has been associated with the instance. If either of these conditions have not been met, the lambda will either add tags with the CreateTags API call or add in the administrator security group with the ModifyInstanceAttributes API call.

![Way Three](/images/CWE-Lambda-1024x607.png)

{% gist f1b642c0ff9d52f42a985aface61da91 %}

# Next Steps

Though these examples are enough to get you started and thinking about how Event Driven Architecture can help you meet the security and compliance requirements of your organization, they also leave much to be desired.

One consequence of implementing event driven remediative actions is that it can create drift between your Infrastructure as Code and actual infrastructure configuration. It is usually more important to have secure and compliant infrastructure, but drift should be addressed by changing your Infrastructure as Code configurations whenever non-compliant resources are fixed by one of these processes. Adding automated notifications as a result of remediative actions will help identify where drift would occur and allow faster feedback for engineers creating offending resources.

# Conclusion

These examples, while not suitable (in their current form) for deployment in a large enterprise, should provide a basic understanding of Event Driven Architecture in AWS that can be leveraged to meet the needs of an organization. Feel free to take these examples, use them, and build on them to fit your specific use cases. For instance you may wish to add support for multi-account environments, an exemption mechanism for avoiding certain remediations, or logging to track remediation activity.

We would also like to encourage you to dig deeper into the CloudWatch Events and Event Rules documentation. What we have presented here is just a tiny fraction of what is possible using these tools. Leveraging them will help make your organization and infrastructure more efficient and more secure.

And, as always, if you think your organization could benefit from Stelligent’s expertise in DevOps and Cloud Security, please reach out to us to see how we can help improve the speed and security of your software and infrastructure delivery processes.

---
layout: post
description: "New Project: DVLDB"
title: "DVLDB Dynamic Vulnerability Layer Database"
categories: security cloud kubernetes
---

<figure style="text-align:center;">
<img src="/assets/dvldb.png" width="300" alt="DVLDB">
<figcaption>DVLDB Logo</figcaption>
</figure>

The last few months have been a lot of work in kubernetes security and I've been really enjoying educating clients on how to effectively test out their kubernetes security tooling. Rather than just manually running the same scripts to show off insecure configurations, I figured I could combine the power of [CDK8S](https://cdk8s.io/) and known insecure configurations to create [DVLDB](https://github.com/That-Cloud-Group/dvldb-cdk).

## IaC for (in)security

I think the first question I would ask myself about this is "what value is there library of IaC templates that do bad things in a kubernetes cluster?"

I already gave one answer: that you can use these templates to test your defenses. But, I actually envision quite a bit more than that for the project. First, I always enjoy IaC for its ease of deployment and automation. Presumably, you could take these templates and deploy them into your environment on the regular to make sure that the proper notifications from your tooling ends up in your SOC or a sandbox environment.

As a side effect, if a community were to develop around this concept of sharing insecure templates, you could actually share a lot of security knowledge and training with those just getting started in kubernetes. I feel that there're organizations out there who would like to share what sort of controls and insecure configurations they deem insecure with the general public.

## Devising the templates.

I think a big question for folks when they adopt a platform like kubernetes is "how can I understand _why_ something is insecure?" I like to think the best way is simply reverse engineering public information on security events.

For a while now there have existed tools that will look at applications and clusters and tell you about the security configuration stance and pretty much give a pass/fail on security. While I think most people can understand the output and even fix the findings, they rarely take the time to understand why or how those configurations exist. Open source tools will share what they're looking for, which should lead you to be able to replicate the insecure event or condition that triggers the tools.

Additionally, public hacks like log4j or many supply chain attacks can be replicated in certain environments using templates like the above.

And then finally, and most importantly, you can use these templates as a starting point for your own specific controls. If your organization is certain they never want services exposed on a certain port, then absolutely you could create a template that allows you to deploy that in your environment.

## Getting your digital hands dirty.

I really think developing and deploying for security is far more important than typical reading documentation. If there's a vulnerability out there that your team is worried about, I sure hope someone has taken the time to deploy and test an exploit, as it'll prepare you a ton as defenders. Similarly, if you're upskilling teams on kubernetes security and they've never deployed or developed for kubernetes, it'll take significantly more time to establish comfort with the platform.

Yes, DLVDB is much more focused on the security testing and automatoin side. But, it's also an opportunity to _do_ something in front of clients. It's so boring to just explain kubernetes security and explain why `privileged: true` is a bad thing. Let's deploy that pod as privileged and do some damage.

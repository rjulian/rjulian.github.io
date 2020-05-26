---
layout: post
description: "An introduction to AWS Landing Zone"
title: "Touching Down with AWS Landing Zone"
categories: cloud security
---

Recently tasked with exploring the AWS Landing Zone managed solution, the following speech and [resulting slides](/assets/AWSLandingZone.pdf) were the outcome of some trial and error in the LZ space.

# What is Landing Zone

Essentially, AWS Landing zone is a semi-managed solution provided by AWS that creates an opinionated multi-account setup inside of an AWS Organization. As of this speech, the solution isn't public and is provided by AWS Proserve. While it's currently available via the web resources I've provided, those endpoints are not well advertised. 

# Multiple Account Structure

AWS has long held that a multi account solution is the safest way to separate concerns in their cloud. There're a number of [great](https://www.youtube.com/watch?v=pqq39mZKQXU) [talks](https://www.youtube.com/watch?v=71fD8Oenwxc) on the subject of multiple account strategy in AWS that can speak volumes as to the "why" you would want to follow this pattern. Essentially, the separation of core cloud functionality in different AWS accounts allows better use of preventive controls and
considerably better ability to assess least privilege access. 

The problem with this setup, however, was that it was painstaking to automate and manage. Before Landing Zone started aiding in that effort, most teams were faced with rolling their own account automation solution.

# The Solution

LZ is provided with an initiation CloudFormation template that essentially bootstraps a master account with the required infrastructure to deploy out new accounts and update existing baselines. Essentially, the solution provides a CodePipeline resource that takes in a repository of infrastructure as code to manage infrastructure as code (meta, I know). This pipeline not only initially inflates core accounts (such as a providing GuardDuty resources in a security account), but also
guarantees the existence and consistency of account baselines.

As of this version (1.1), Landing Zone can be extended, though not without a fair bit of understanding of CloudFormation and Stacksets. Troubleshooting via step functions is also a rather helpful skill to have when managing LZ.

# Conclusion

Without a doubt, AWS Landing Zone has a role to play in the greater account security space. As of now, it's a handy automation tool that I would absolutely imagine becomes a managed service within AWS. 

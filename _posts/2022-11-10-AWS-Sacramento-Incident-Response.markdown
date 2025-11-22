---
layout: post
description: "Presentation at AWS Sacramento meetup on native IR infrastructure in AWS."
title: "AWS Sacramento: Building AWS Incident Response From Scratch"
categories: security cloud
---

Conjured up a presentation for the November AWS Sacramento meetup on the native tooling and infrastructure available for incident response in AWS. The presentation was not recorded, but I've included the slides at the bottom of this post. Essentially, I show the possibilities of incident response infrastructure from absolutely nothing all the way to automating large parts of analysis and containment. When it comes to my recommendation for organizations that don't have a dedicated security
team, I emphasize the minimal implementation of GuardDuty and SNS as a way of getting some sense of what's happening.

I've created a Github repository with a CDK implementation of the various architectures: [rjulian/aws-incident-response-bootstrap](https://github.com/rjulian/aws-incident-response-bootstrap).

<object data="/assets/incident-response.pdf" width=1000 height=500 type="application/pdf"></object>

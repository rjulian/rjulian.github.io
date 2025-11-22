---
layout: post
description: "My recent work with ONUG's CSNF."
title: "ONUG's Cloud Security Notification Framework"
categories: security cloud
---

Thanks to a recommendation from a dear former manager of mine, I've recently been connected with the fine folks at [ONUG](https://onug.net) to help out with a project called [CSNF](https://github.com/onug/CSNF).

## What's a security notification framework?

To understand the problem that CSNF is trying to solve, it helps tremendously to have worked with incident responders or with observability teams at companies that have a vast amount of infrastructure. As we're seeing more organizations move to hybrid cloud models and adopting numerous SaaS offerings, the amount of log message formats becomes immense. In my experience, this results in the humans who do investigations or analyze the logs having to do the mental math of "which field for this service maps to the created timestamp? which of these fields refers to an identity?" and such questions.

The goal of CSNF was to really push organizations to at least adopt a common language for common fields. Ideally, the producers of the messages would conform to a sane standard, but today that's not happening. So, in the meantime, what organizations can do is implement a plugin to their observability tooling that maps known fields in log messages (e.g. AWS's GuardDuty or Oracle's Cloud Guard) to the CSNF designated fields. Now, even though it's not the _true_ field label of the message, the end user teams (be it a SOC team or an infrastructure team) can use these mapping fields in their search queries and in their dashboards across clouds and services.

## Why do I want to solve this problem?

It's always vexed me that there aren't more requirements for consistency in modern infrastructure. Especially, from a security perspective, I've seen teams just overwhelmed with the complexity of managing two clouds and three external services (not to mention an internal application and whatever infrastructure it relies on). From a DevSecOps ideal, you'd have security engineers embedded with application teams who could provide detailed information about the security focus of each service, but in practice, that's very rare. And even if you do have that person, would they always be on call? Or how would they make sure proper controls are in place and being monitored?

So, to me, the consumers of these services should be demanding coordination on the front of security from these providers. I understand that the goal in most cases is vendor lock in, so collaboration is one of the last things they would seek to do. However, it wouldn't surprise me if there one day is a requirement to follow some coordinated compliance of security information that's enforced by law, just to help organizations who do not have the resources to scale a security team effectively.

CSNF is a step in this direction, only without the compulsory adherence by the producers of data. When companies and executives see what the experience is like for first line responders, I think they'll recognize the value in this framework.

## What next?

An upcoming event we're putting on for CSNF is a Capture the Flag at ONUG's Fall Event in New York. I'll make sure to write about that event after it happens, but ultimately it'll highlight the reality of multi-cloud incident response and the value-add of using CSNF. It'll also be pretty challenging. Teams will essentially have to interrogate a set of data with the hopes of creating an effective post mortem.

Besides the CTF, I plan on helping out by contributing mappings and some improvements to the codebase and project. Most of the big picture work falls in marketing and making sure we're getting traction, but I want to contribute to make CSNF look appealing to security professionals.

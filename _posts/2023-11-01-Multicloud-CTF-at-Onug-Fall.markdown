---
layout: post
description: "ONUG Multicloud CTF showcases what incident responders handle in hybrid cloud environments."
title: "Multicloud CTF at ONUG Fall 2023"
categories: security cloud ctf
---

<figure style="text-align:center;">
<img width="800" src="/images/onug.jpg" alt="Presenting at the CTF">
<figcaption>Explaining Splunk at the CTF</figcaption>
</figure>
 When I was first brought into contact with ONUG and the CSNF project, one of the big needs of the organization was to hold an event for their October conference. When they said they were looking for something like a capture the flag competition, I was totally sold on being a big part of the event.

## Designing the first Multicloud CTF for ONUG

I've been involved with security competitions for years, both public capture the flag events and custom security jams held inside organizations. What I'd never seen, however, was something focused on multi cloud observability data, so I knew we'd have to really spend a lot of time designing the experience we wanted for competitors. Since the secondary goal of the CTF was to expose end users to CSNF and how it can help them in incident response, we wanted something approachable enough that you could jump into without any specialized technical skills, but deep enough in the problem space that you truly understood the value add of adopting CSNF.

We iterated over having live infrastructure requiring patching and the possibility of fixing cloud infrastructure misconfigurations. Ultimately, we realized that we should focus on where incident response professionals spend most of their investigation time: querying toms of log data. In the case of the CTF, that meant Splunk and luckily we worked closely with some incredible technical folks from Splunk to help coordinate some of the infrastructure and challenges.

So, we knew that we were going to be using Splunk as the primary "platform" for the CTF, but we didn't know just how we'd enable access for participants. That's where the amazing team at [World Wide Technology](https://www.wwt.com/) came in to provide this really slick interface that they use for customers accessing security testing environments. Honestly, when WWT stepped in and mentioned that they'd be hosting the platform, I was incredibly skeptical that the systems would be performant and that access would be smooth, but once I started working with their ATC team to build out the scenario infrastructure, I knew I was in good hands, huge props to Dennis and Zach at WWT for all the help during the design phase.

Now that we knew the perspective we were going with for the CTF and had a sense of how we'd ultimately make it available to the participants, it was time to start thinking about the competition itself. To kickstart that, I made sure to spin up a [CTFd](https://ctfd.io) instance and just build out an example of what I would expect to see, question wise. This helped me start thinking about question format, clues, and _how_ we'd ask participants to solve the scenarios.

## The Scenarios

Note: Because these scenarios are likely to be used in the future, I won't give them away fully. I plan to later do a rundown of the scenarios.

So okay, platform and game mechanics are mostly figured out. Now we have to come up with the actual content. We had decided early on that it would be best to "warm up" participants with something slightly less complicated and straightforward. This would make them comfortable with the platform and the tooling and ultimately gear them up for a bigger dive into security investigations. So, I needed an investigation into something in one single cloud and then open up the competition to a stumper that should really strain experienced engineers.

I have been involved with a number of security gamedays in my time, so I didn't need too many ideas for the simpler scenario. I figured if we did a single cloud with multiple services and log formats, that's complicated enough to show what we're hoping for, yet simple enough that you don't feel the need to know subject matter outside of that one cloud. I figured a VERY run of the mill GuardDuty alert on public S3 bucket -> S3 data exfiltration attack would be a good warmup. For good measure, we'd put in a few complicated "twists" so that people who wanted to dive deeper into the investigation and provide a more sound root cause could do so, for additional points.

For the second, much more complicated scenario. We wanted to do two different clouds and four different service logs. With tons of help from Josh Halimer from Oracle, we collaborated on an AWS and OCI based scenario that fit the narrative of hybrid cloud resilient infrastructure. Essentially, a business critical app had its infrastructure mirrored in both clouds and shared data across both clouds. We would inevitably do things in both clouds that would trigger their various security services (GuardDuty, Cloud Guard) and then prompt the participants to better figure out how the attacker had gotten in, what they had done, and what the impact would be to the org. The genius of what Josh and I cooked up was that it you initially think the attacker stayed in OCI, but really the lateral movement happens as part of an application flow and it's _quite_ challenging to detect.

Honestly, working through the last scenario with Josh just reminded me of how much of an uphill battle incident response is in the modern era. You have to know application specifics, cloud specifics, SaaS specifics and you have to be able to act quickly.

## How CSNF Fits In

On that note, building out this scenario really highlighted the need for CSNF to me. I have decent experience with AWS log formats and the meaning of log output by AWS services, but Oracle was a new area for me on the security side. And, honestly, without the mappings that Josh had made for the OCI logs, I would've had to upskill and learn quickly to be able to identify exactly what fields correspond to what. I can only imagine, in a scenario where you are using maybe two clouds and a few security vendor tools, you'll absolutely benefit by seeing the CSNF fields highlighted across all of your compliant services.

Of course, since it's 2023, I also can't help but think about how this will work for AI. I can imagine if you were leveraging an LLM for going through log data, you would absolutely struggle knowing even something as simple as timestamps across multiple clouds without some sort of unifying identifier.

Ultimately, I had a blast working on this for ONUG. The implementation at the event was super fun and I'm hoping that the future we can expand upon this and grow into a bigger competition.

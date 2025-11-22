---
layout: post
description: "Overview and takeaways from 2022's holiday hack challenge."
title: "SANS Holiday Hack Challenge 2022"
categories: security
---

<figure style="text-align:center;">
<img src="/assets/bored_sporc.png" alt="Bored Sporc Rowboat Society">
<figcaption>Bored Sporc Rowboat Society</figcaption>
</figure>

I've been a fan of the [SANS Holiday Hack Challenge](https://www.sans.org/mlp/holiday-hack-challenge/) for a long while now, but there're very few years that I get to spend time working through the challenges.

## Branch Out

Pretty much every year, I've recommended my team and friends take part in the holiday hack challenge as a way to get different perspectives on our industry. Our careers are generally so specialized and focused on a given subject matter that we seldom learn about the tools and mechanics of other areas of security. For example, I almost never spend my time using burp suite to attack web apps or even writing suricata rules to harden network access.

Is it crucial for my interests and job to know these things? No, however, being prompted to learn them quickly to solve a challenge does satisfy the craving to learn and really gives a sense of empathy to being new to a technology. That empathy is massively important, whether you're applying it to undertaking new challenges at work or to mentoring more junior colleagues who are onboarding to the tools and processes of your position.

## Takeaways

### PCAPs

I used to spend a ton of time working with Wireshark and protocol analysis and the challenges this year reminded me how much fun it is on the investigation side. I've regularly asked over the last few years whether or not packet capture is still relevant with modern architectures, but, especially in the use cases in the challenge (analyzing activity of malware), I know that it's still important. My takeaway from this challenge is to find captures from a known compromised k8s node and build a similar detective challenge as a training module for incident responders.

### AWS CLI Training Module

Anyone who has done [flAWS](http://flaws.cloud/) or any AWS Security jams will find the HHC challenge to be very straightforward and easy. This makes sense, as the goal is really exposure rather than mastery in depth. I will say, that AWS should take note of how the AWS CLI is taught in this challenge, as it's a really fun and interactive way to master the CLI tool. I'd love to see an expanded version of this challenge leveraging the SDKs though.

### Hacking the Pipeline

After spending time this year on [CICD Goat](https://github.com/cider-security-research/cicd-goat), I was excited to see a pipeline focused challenge in the HHC. This challenge did not disappoint, either, especially when I consider the challenge from the perspective of someone newer to the industry. I liked that there was really an omnibus of skills you needed to actually attack the infrastructure involved and you had to actively trigger the pipeline in order to solve this challenge. Hands down my favorite challenge this year, but I'd also love to see this expanded in the future leveraging pipeline permissions security issues.

### Crypto and Web

The crypto challenge this year was a fun addition. I always enjoy seeing that they modernize the challenges to involve modern technologies that are susceptible to classic attack patterns. It also helped with the copious tongue-in-cheek flavortext surrounding the crypto challenge.

## Next Year

Building these challenges is thankless work, but I find them to be invaluable on a personal and professional level. We need to regularly be reminded of being new to things. Our challenges in our work lives don't always match those of the world, especially if you're in a role that is specified. I'm hoping in the next year we see a bigger variety of these experiences pop up on the web that challenge our industry. I'd love to see these challenges translate into certifications (a la the CKA certification exam).

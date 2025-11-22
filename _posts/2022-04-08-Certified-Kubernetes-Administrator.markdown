---
layout: post
description: "How I found the certified kubernetes administrator exam."
title: "Certified Kuberneted Administrator Exam"
categories: linux kubernetes
---

I've recently taken and passed the Certified Kubernetes Administrator certification exam. k8s is more and more prescient in our lives as technologists and I was curious to explore both the platform and its security in recent years. This certification was an attempt to put a stamp on that education. Overall, I found the education of the platform to be really rich, while the exam itself was more onerous than it needed to be.

Before I dive into the CKA, I do want to get out of the way my overall theory of certifications. I look at this in two lights: for those early in their career and for those further along in their career. I'm a huge believer in certifications if you're lacking significant job experience, as they're voluntary education in a given subject that shows extra initiative to an employer. When it comes to more established developers and engineers, however, I care less about certifications and more about their experience building and solutioning. That said, attaining certifications is never detrimental and for those who can't publicly share what they're working on, it's a tool to indicate that professionally you're staying relevant in various technologies.

## The Prep

Probably my **main takeaway** from the CKA is the preparation given by the [killer.sh](https://killer.sh/) platform. It's important to note that the CKA is a simulation-based exam rather than a multiple choice exam. Already, I like this so much more because the certification really should prove that you can do the job rather than just memorize information. The killer.sh platform very smoothly facilitates that on-the-job aspect by launching you into a browser-based environment where you can practice many of the tasks that the exam asks you to do.

I want to reiterate that the platform itself is really slick. You don't have to SSH anywhere or run anything on your local machine. You can essentially practice for the exam (and then take the exam on the same platform) on any device that can effectively access the browser. From an access perspective, this is a huge deal as I've ran numerous trainings and workshops where we'll spend half the time troubleshooting system issues and the browser solves all of those problems. This is the future, in my opinion, of where we're heading for everything, but it makes especially good sense for training and education.

The content in the labs is also really pointed. Even for free, I believe you get access to a number of scenarios that are close to the objectives of the CKA. Just by registering for the CKA, though, you get access to the full simulator which gives you two exam simulations that you can take before taking the actual exam. This is crucial for making sure that candidates are prepared and it can help you gauge what you need to learn in order to pass the exam.

## The Exam

Despite how overly positive the preparation for the exam was, I must admit that I didn't enjoy this exam at all. I found the process of taking it to be way more stressful than it needed to be, not because of the content or lack of preparedness, but rather the time restriction. You're limited to two hours for the CKA and I assume that they know that there's easily three hours worth of content in the exam. This time restriction must be in place as a way to prevent cheating or utilizing external resources while in the exam, which I wholly understand would be a huge problem if it were completely untimed.

The major downside of this time restriction is that you learn (via the exam simulations) to be quick rather than to be really effective/thorough. I'm hoping that candidates see this in the context of the exam and know that in the real world, you're not usually limited in time like this and I'd rather have thorough review than as fast as possible analysis. If the folks at the Linux Foundation can think of ways to re-tool the exam away from being what I describe as the olympic event of frenzied CLI aliasing and gut decision making, they would hands-down have one of the best industry certification exams.

The advice I have here is to take the simulations two or three times each. They give you access to the simulation platform for 48 hours take it and use the timer, then walk away and come back in a few hours and try it again.

## The Value

My main job is not as a k8s administrator, but now I can play one on TV. Jokes aside, you really must learn the platform and more specifically how the `kubectl` tool interacts with the platform in order to pass this exam and for that alone, it's worth the value. By comparison, the information I've crammed in the past for multiple choice certification exams can be forgotten in almost no time (e.g. all of the questions I answered about AWS Opsworks years ago), but you have to really put into practice the k8s concepts by using the documentation and the `kubectl` commands so that it's hard to really not sink in the concepts. Overall, this is a great certificate for the industry.

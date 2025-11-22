---
layout: post
description: "Slides from Tinc VPN Speech given at Sacramento Linux Users Group on January 26th, 2017"
title: "Speech: Tinc VPN in a Makerspace"
categories: networking tools
---

I gave a quick little speech at the [Sacramento Linux Users Group](http://saclug.org) about how I use [tinc-vpn](http://www.tinc-vpn.org) in our makerspace.

As you can see from the slides, there were demos shown of how easy it is to get up and going. You can get a lot of that from the official tinc documentation as well as [this pretty handy Digital Ocean guide](https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04). Setup for Xenial (Ubuntu 16.04) is similarly straightforward. Though, I have heard of issues with the systemd setup.

Personally, I've been getting familiar with the 1.1 branch of tinc, as it allows for a bit more control and data collection than the 1.0 branch. It's a small project, but I created a minimalistic GTK indicator applet, called [tinc-applet](https://github.com/rjulian/tinc-applet) that let's me know all of the connected hosts on my network. I'll be cleaning up the code and maybe adding some features in the following weeks.

For the presentation, check out the slides [here](http://www.rjulian.net/assets/tinc_vpn_presentation.pdf)! Unfortunately, in PDF form you won't get to see the gifs of retro DOS viruses.

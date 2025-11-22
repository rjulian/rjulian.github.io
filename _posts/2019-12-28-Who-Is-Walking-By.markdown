---
layout: post
description: "Privacy, wifi beacons, and raspberry pi."
title: "WhoIsWalkingBy: Wifi Beacon Collection"
categories: hardware networking
---

During the holidays, I decided to get back to hacking with the Raspberry Pi and I went back to one of my favorite subjects of packet sniffing. What resulted was a very short-lived project called WhoIsWalkingBy, passively monitoring the street below my house of all the devices that would walk by.

# Concept

The idea for WhoIsWalkingBy was spurred from my most recent trip to AWS:ReInvent and the [use of Bluetooth Low-Energy tracking beacons](https://www.vice.com/en_us/article/pkeyqk/amazon-conference-badges-tracked-attendees-movements) to monitor the movement of attendees. Previously, I'd used the Raspberry Pi and the airmon toolsets to monitor connected hosts in certain locations for the purposes of triggering events (e.g. a robot greeting someone entering a room). I was familiar with the fact that
the airmon toolset also was able to pick up WiFi beacons (essentially a ping from your phone when it's not connected to wifi) and wanted to explore what data, if any, I could surmise from collecting my own little sample of tracking data at home.

# Execution

As mentioned, the heavy lifting for this project had already been undertaken by the folks at [aircrack-ng](http://aircrack-ng.org/) to create a handy tool for collecting the data. However, I quickly realized that the `airodump` tool left a lot to be desired in the sense of storing data in a queryable database. Hence, I wrote a simple tool called [airodump2sqlite](https://github.com/rjulian/airodump2sqlite/) that would convert a CSV output file of airodump into a relatively
usable sqlite database.

From there, I created a simple frontend in flask to present the data:

<img src="/images/whoiswalkingby.png" width="600">

The identifier field represents a unique MAC address of a device that had walked by. I had clearly filtered out devices too close (i.e. less than -60 signal strength) and exposed the Wifi broadcast SSID the packet was looking for.

Those devices with a higher number of packets generally either had visited our area and lingered a while (e.g. visiting friends), while there were devices picked up that had to have been from passing motorists/cyclists, as they left behind so few packets that it wouldn't make sense for a walker.

# Conclusion

That is kind of as far as I wanted to go with this project for now. I had these great ideas of installing this in a few friend's houses and seeing if we could capture multiple hosts walking between points in our city or setting up a voluntary network where the data collection results could be shared for the sake of mapping host movement (similar to the mapping of WiFi SSIDs).

Then, I remembered, I'm currently satisfied not running a network of people spying on end user's devices. What I was
ultimately hoping to prove was that it's both cheap and trivial to build this sort of passive scanning device and the data it provides can absolutely be used to infer a lot.

---
layout: post
description: "Rundown for installing Wireshark from source with GeoIP enabled."
title: "Installing Wireshark from Source with GeoIP Enabled"
categories: tools protocols
---
Perhaps I was missing something in the documentation, but for the life of me, I wasn't able to find a guide on building Wireshark from source with GeoIP lookup enabled. Wireshark has [great documentation on using GeoIP](https://wiki.wireshark.org/HowToUseGeoIP), but the process of getting a copy of Wireshark with 'GeoIP' enabled isn't spelled out at all. I assume this could be because certain packaged versions of it come with GeoIP enabled by default.

Needless to say, for those of us who are installing from the source package, you may find yourself baffled by the output of `./configure --with-geoip=yes` continually showing `Use GeoIP library : no`. Clearly, we want the GeoIP abilities in Wireshark but a test is showing that we just can't have it.

In the configure script, it attempts communicating with a C GeoIP library to test whether or not Wireshark can be built with GeoIP. Okay, this is a great hint. Searching, it seems that the lovely people at MaxMind actually [have a C API](http://dev.maxmind.com/geoip/geoip2/downloadable/#MaxMind_APIs) for working with their GeoIP databases (I had known about the ruby gems, but not libgeoip). Sweet! Install their libraries (if you're using Ubuntu, they actually have a PPA and you can install the library through apt) and then configure again with  `./configure --with-geoip=yes`. This should be your desired setup.

If successful, the output from *Help*->*About* will look like:

![About Output From Wireshark](/images/wiresharkgeoip.png)

Hope this is helpful for anyone who is having issues getting Wireshark installed with GeoIP enabled.

---
title: Quick and Dirty Guide to Command Line Wifi
author: Richard Julian
layout: post
date:   2014-06-09 12:00:00
---
**THE QUICK AND DIRTY**

So, you&#8217;re working headless on the Raspberry Pi, Beaglebone Black, or just a machine which relies on wireless connection. Theoretically, you&#8217;re without an internet connection and therefore you don&#8217;t have access to easy tools like **NetworkManager** or **wicd**. <span style="text-decoration: underline;">As root/sudo</span>, this is what you do:

**THE SETUP  
**

In order to connect, one needs the very common **wpasupplicant** package installed. In many distros, this is installed by default.

Next up, it&#8217;s important to <span style="text-decoration: underline;">know your interfaces<strong>.</strong></span> Use **ifcon****fig** **-a** to list all interfaces (and identify your wireless interface name). Often, it is wlan0 or wlo0. Make sure the interface is up by running **ifconfig wlan0 up **(replace wlan0 with your wireless interface name).

Now, let&#8217;s create a config file to be used by wpa_supplicant. There&#8217;s a nifty command for generating this in the form of **wpa_passphrase \[SSID\] \[password\] > /etc/wpa.conf **where ssid is the name of the network, note: don&#8217;t enclose them in quotation marks.

**CONNECTING **

Now the fun part. Using the recently created config file, we&#8217;re going to connect to the network and then request an IP address from DHCP.

The command to connect is: **wpa_supplicant -iwlan0 -Dwext -c/etc/wpa.conf** . Once it authenticates successfully, in a different terminal, we request a new IP address by first releasing previous leases and then asking for a new lease: **dhclient -r && dhclient wlan0**

Granted you tailor this to your own interfaces and your device has correct drivers, you should be connected to the network. You can check by running **ifconfig** and seeing if the wireless interface has an IP address.

**EXTRA HELP**

So, that&#8217;s a very simple example. What if you don&#8217;t know the network ssid? Use **wpa_cli** to scan for network info (read the manpage). Instead of using the wext driver (which is a generic driver provided by wpa_supplicant), you could select a driver more suited to your wireless card. Troubleshoot effectively by <span style="text-decoration: underline;">checking the logs</span>. In Debian-based distros, the log for wifi is often **/var/log/daemon.log**. Don&#8217;t want to waste an entire terminal on running wpa_supplicant? In addition to the many options, also give it **-B** so that it runs in the background.

And remember, search engines are your friends for troubleshooting wireless problems.

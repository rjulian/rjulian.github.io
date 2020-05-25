---
layout: post
description: "We used the Raspberry Pi Sense HAT's joystick to interact with the REST API of the Philips Hue to control hue and brightness of the lights in our space."
title: "Project: Changing Smart Lights with a Raspberry Pi"
categories: hardware
---
<img src="http://makerhq.org/images/light_switcher.gif" class="image" style="margin: 0 auto 10px; display: block;">
<span id="hq">W</span>e used the [Raspberry Pi Sense HAT's](https://www.raspberrypi.org/products/sense-hat/) joystick to interact with the REST API of the [Philips Hue](http://www2.meethue.com/en-us/) to control hue and brightness of the lights in our space.

In one of our [recent meetups](http://www.meetup.com/Sacramento-Open-Hardware/events/231319343/) we were showing off how quickly you can go from 'what do I do with my Pi' to interactive prototype with the [Raspberry Pi Sense HAT](https://www.raspberrypi.org/products/sense-hat/).

Beyond having a really cool 8x8 LED Matrix and a myriad of sensors, you are also given a joystick input on the device. To me, one of the quickest and most impactful demo applications is showing that the joystick input on the Sense HAT can be used to control your smart home devices. In our case, we wanted to connect and work with a [Philips Hue](http://www2.meethue.com/en-us/) internet connected lightbulb.

<img src="http://rjulian.net/images/pi_hue.jpg" class="image" style="margin: auto; width: 50%; display: block;">

To replicate this project:

1. Set up a Raspberry Pi with Raspbian (extra points for setting up wifi!)
2. Install the HAT and [set up the Raspberry Pi Sense Hat software](https://www.raspberrypi.org/learning/getting-started-with-the-sense-hat/requirements/software/)
3. Install evdev for joystick use <code>sudo pip3 install evdev</code> (you may need to run <code>sudo apt-get install python3-pip</code>
4. Set up your Philips Hue lights based upon the instructions provided (use the app at first to make sure they work!)
5. Go through the [getting started steps for the Hue API](http://www.developers.meethue.com/documentation/getting-started)
6. Take note of the URL you are using to interact with the light's hue, as it will be used in our code.
7. Save the [code at the bottom of the page](https://gist.github.com/rjulian/b92d43f8b6378c57dd96d71eaf064438) as sense_hue.py
8. Run <code>python3 sense_hue.py</code>

You should be able to start using the joystick to change the Hue by moving to the left or right and change the brightness by moving the joystick up and down.

[Check out the code on github!](https://gist.github.com/rjulian/b92d43f8b6378c57dd96d71eaf064438#file-makerhq_sense_hue-py)


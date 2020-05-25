---
title: 'Raspberry Pi Project : Motion Sensor Fortune Teller'
author: Richard Julian
layout: post
categories: hardware
---

![Model](/images/raspberry_pi_talker.jpg)


Want a unique, possibly creepy little feature for your next dinner party? Install a Raspberry Pi powered fortune teller robot (complete with mannequin head!) in your bathroom! It&#8217;s a simple project that involves sensors, text to speech programs, and a fair bit of fun. There&#8217;s nothing like having your guests come out wondering why the mannequin head in the bathroom just told them &#8220;Don&#8217;t go surfing in South Dakota for a while.&#8221;

**PARTS**

Required are the following parts:

* Raspberry Pi
* Solderless Breadboard
* Wires (six needed, all Male to Female)
* Passive Infrared (PIR) Sensor Module (Buy from [Adafruit][2] or quite cheaper, from [ebay][3])
* Speakers

Optional parts include:

* A USB hub (to power multiple things, e.g. speakers)
* Wireless dongle (for remote control, so you can scare your guests further by having it say their names)
* A creepy mannequin head

**THE PROCESS**

**1. Set up the Pi**

Install Raspbian : numerous tutorials exist for how to do this, Raspberry Pi has documentation [here][4]. Personally, I just have the latest Raspbian img and use the dd command to load it onto the SD card.

**2. Set up the PIR sensor**

For the actual electronics part of this hack, there also exists quite a few tutorials out there. The best explanation for the hardware process was from a [blog post on DataIsSexy][5]. Follow this exactly and you&#8217;re in business.

**3. Set up the software**

And now the fun part of putting it all together. To do this, you can find an awesome write up on using python and the GPIO library for the PIR [at Raspberry Pi Spy. ][6]  This should be everything you need to get going with using a PIR to trigger an event.

To get the fortune telling part, you&#8217;ll need to install **fortune** and **festival** by typing the command **sudo apt-get install fortune festival **.

Festival&#8217;s text to speech default install is, how can we say, rough. I&#8217;d recommend speeding it down and selecting one of the more natural voice packages.

Fortune can also be hacked to your liking. There&#8217;re a number of data files that you can install with fortune giving you seemingly endless quotes to be spoken. I personally enjoyed having it be 50% literary quotes 50% fortunes (the nasty fortunes collection sounds even more fun). The command to do this is **fortune 50% literature 50% fortunes** .

Now, we just plug this system call into our python script for simplicity (something tells me python has a library to do this as well).

The full code, condensed without comments is:

    
    import RPi.GPIO as GPIO
    import time
    import os
    import datetime
    GPIO.setmode(GPIO.BCM)
    GPIO_PIR = 7
    GPIO.setup(GPIO_PIR,GPIO.IN)
    Current_State = 0
    Previous_State = 0
    try:
        print "Waiting for PIR to settle ..."
        while GPIO.input(GPIO_PIR)==1:
            Current_State = 0
        print " Ready "
        while True :
            Current_State = GPIO.input(GPIO_PIR)
            if Current_State==1 and Previous_State==0:
                print " Motion detected!"
                print datetime.datetime.now()
                os.system("/usr/games/fortune 50% literature 50% fortunes | tee -a fortunes | /usr/bin/festival --tts")
                time.sleep(90)
                Previous_State=1
            elif Current_State==0 and Previous_State==1:
                print " Ready"
                Previous_State=0
            time.sleep(0.01)
    except KeyboardInterrupt:
        print " Quit"
        GPIO.cleanup()
    

Should be pretty apparent what the command does. The only thing I haven&#8217;t mentioned is the **tee -a fortunes** command. It creates a file (named fortunes) with the text info appended every time the command is called, it&#8217;s a way of logging quotes said (in case someone didn&#8217;t understand it).

**SET IT UP**

Now just plug it in and set it  and forget it! It&#8217;s a fun and easy project. And you could create a simple way of having it say custom commands over an ssh connection (requires wireless dongle and ssh server running) and the command **echo &#8220;Hello There!&#8221; | fortune &#8211;tts**

 [1]: http://rjulian.net/wp-content/uploads/2014/08/raspberry_pi_talker.jpg
 [2]: https://www.adafruit.com/products/189
 [3]: http://www.ebay.com/sch/i.html?_from=R40&_sacat=0&_nkw=PIR+sensor+module
 [4]: http://www.raspberrypi.org/help/noobs-setup/
 [5]: http://dataissexy.wordpress.com/2013/06/29/raspberry-pi-pir-motion-detection-and-alerting-to-sms-raspberrypi-sms-sensors/
 [6]: http://www.raspberrypi-spy.co.uk/2013/01/cheap-pir-sensors-and-the-raspberry-pi-part-1/

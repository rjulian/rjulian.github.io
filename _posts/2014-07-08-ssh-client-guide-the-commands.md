---
title: 'SSH Client Guide : The Commands'
author: Richard Julian
layout: post
---
**SECURE SHELL**

**ssh** is a tool that almost every Linux user will come across when working on multiple systems. [OpenSSH][1] (developed by OpenBSD) is rather simple to use for the purpose of remote login, but there&#8217;s a wealth of options and features that can make ssh do so much more.

**THE BASIC COMMAND**

SSH is usually invoked as follows: **ssh user@remote_machine**. An example would be **ssh richard@rjulian.net **or **ssh user@198.187.31.129 **; You&#8217;re prompted to enter a password, guess correctly and you&#8217;re in! Simple as that.

**THE BASIC OPTIONS**

**-p  *port* **:: to specify a port other than standard 22. e.g. **ssh -p 6593 richard@198.178.30.195**

**-i *keyfile* **:: to specify a public key for key based authentication

**-e *character* **:: to specify an escape character (~ is default); escape character + &#8216;.&#8217; will close connection. **e.g. ssh -e @ root@rjulian.net**

**-o *****option ***:: to specify a unique config option not in the config file, for this session only. **e.g. ssh -o &#8216;LogLevel INFO&#8217; admin@192.168.1.1 **

**-X **:: Enable X11 Forwarding (if remote machine allows in their sshd_config), you can now open x applications from the command line that are running on the remote machine, but appear on your local machine.

**PORT FORWARDING WITH SSH**

**-D** **\[optional*bind*address:\]*port ***:: Dynamic port forwarding with a SOCKS5 Proxy. This is useful when you want to browse securely out of the house. Once the command is run, simply change browser settings to use a SOCKS proxy on localhost with whatever port you decide. Add the -N command to not execute a remote command (essentially: set up the forwarding only).  **e.g. ssh -D 8080 user@homeserver.com -N **

**-L *****clientport*****:*hostname*:*hostport* **:: Local port forwarding between a client. Forward the host port from the host to your local port. For example, to access a web server from a remote machine on your local machine (say, you wanted to access a work project from home), you would do: **ssh username@workmachine.net -L 80:****workmachine.net:80 -N **

**-R *remoteport*:*localhost*:*localport***:: Reverse SSH tunneling with a client. Forward your local port to the remote server. With the same example, we want to give access to my local web server to one of my remote machines (they can connect to it by connecting to localhost:8080 with this setup) : **ssh username@workmachine.net -R 8080:localhost:80**** **

**REFERENCE**

There&#8217;s definitely more to SSH than meets the eye. There&#8217;s also IP forwarding with the **-w** option by creating tun interfaces (a future post, maybe).

Learn more at the [ssh(1)][2] man page and of course, [OpenSSH.com][3]

 

 [1]: http://www.openssh.com "Open SSH"
 [2]: http://www.openbsd.org/cgi-bin/man.cgi?query=ssh&#038;sektion=1
 [3]: http://openssh.com

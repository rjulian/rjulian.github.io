---
title: 'SSH Client Guide :  The Config File'
author: Richard Julian
layout: post
---
Now that we know all of these cool client commands , let us make our lives so much easier by setting up a client config file so we don&#8217;t have to type in all of those nasty options.

**SIMPLE HOST CONFIG**

Regularly sshing to a machine? You likely want an ssh config file. This can be stored in */etc/ssh/ssh_config*  (universal) or *~/.ssh/config *(local user).

Let&#8217;s say you regularly log in to a remote server with a nonstandard port (29503) and using a public key.

**Host** webserver

<p style="padding-left: 30px;">
  <strong>HostName </strong>web.server.com
</p>

<p style="padding-left: 30px;">
  <strong>User </strong>username
</p>

<p style="padding-left: 30px;">
  <strong>Port </strong>29503
</p>

<p style="padding-left: 30px;">
  <strong>IdentityFile </strong>~/.ssh/key_file
</p>

You would now ssh with those options by typing **ssh webserver** . This is equivalent to **ssh ****-p 29503 -i ~/.ssh/key_file username@web.server.com**. Even in simple configurations, having a config file can save you from a fair bit of typing, if you&#8217;ll be regularly connecting.

**DEFAULT HOST CONFIGS**

SSH config files also can set default options using the asterisk as a wildcard character:

**Host **

<p style="padding-left: 30px;">
  <strong>Port </strong>22
</p>

<p style="padding-left: 30px;">
  <strong>User </strong>richard
</p>

<p style="padding-left: 30px;">
  <strong>ForwardX11Trusted </strong>yes
</p>

This would allow us to put the default port for all ssh connections at 22, username richard, and allow X11 forwarding. These can be overwritten on the command line (with explicit declaration) or by further entries in your config file.

&nbsp;

**Check out all of the config file options to customize and save time with your ssh client at the [ssh_config manpage][2]!**

&nbsp;

 [2]: http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man5/ssh_config.5?query=ssh_config&sec=5

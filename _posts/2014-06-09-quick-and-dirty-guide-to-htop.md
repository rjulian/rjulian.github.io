---
title: Quick and Dirty Guide to htop
author: Richard Julian
layout: post
date:   2014-06-09 12:00:00
---
**THE QUICK AND DIRTY  
**

**htop **is a more feature rich, ncurses-based extension of **top**, a way of displaying and managing processes. htop is **interactive** and you can easily **kill multiple processes**.

**USAGE**

To start htop, simply type it in to the command line. While there are command line options available, the most useful is **-u** / **- -user=USERNAME** to show processes only by one user.

The real functionality comes with the **commands****:**

* **\[Space\]** tags processes to allow actions to be used on (namely, kill), **\[U\] **untags everything.
* **\[F2,S\] **brings you to the setup menu, here you can configure many things, including the layout and info displayed.
* **\[l\]** this is short for **lsof**, which (as long as you have it installed) will show all files open by a given process. **\[s\] **does the same with strace.
* **\[F6,>,<\] **will bring up a list of fields to sort processes by.
* **\[F9, k\] **will perform the kill command on one or more processes.

There also exist **commands for sorting**: **\[u\]** sort by user, **\[M\]** sort by memory usage, **\[P\]** sort by processor usage, **\[T\]** sort by time.

 

 

---
layout: post
title: Internals of /proc in linux
type: blog
tags: [linux,internals]
categories: [systems]
---
**/proc** is a temporary filesystem which linux initializes, in order to keep track of resources and states of each process, as well as system wide resources. Every command line tool like *ps,top,vmstat,free* derives its results from parsing */proc* directory.

```
$ free -m 
           total     used     free   shared  buff/cache   available
Mem:        3771     2921      276      138      573      450
Swap:       6355      667     5688

``` 

```
$ vmstat 
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
0  0 683248 323280  75244 514304    2    3    15    42   62   49 22  2 76  1  0
```

![proc tree map](https://rarchk.github.io/public/images/proc.png){: width="70%" height="auto"}

1. */proc/pid* represents per process resources statistics. It may give you list of file descriptors pointing to files or sockets, opened by this process. 
2. */proc/net* is a virtual place for everything related to network in your running operating system.
3. */proc/sys* is place where you can set or view typical limitations of your systems resources. Like, maximum number of pids, size of pages etc. 
4. */proc/irq*  is a place for interrupt requests. You can taskset, or map irq handling to particualr cpus. 
5. */proc/sysvipc* relates to System V IPC calls for messages (msg),semaphores (sem), and shared memory (shm).

In all, /proc is a very interesting directory of linux. And with little investigation, you can run interesting experiments.
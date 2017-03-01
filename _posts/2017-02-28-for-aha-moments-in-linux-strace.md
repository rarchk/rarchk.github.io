---
layout: post
title: For Aha moments in linux, STRACE
type: blog
tags: [linux,tools,strace]
categories: [systems]
---
Strace traces all system calls that have been invoked by a process/processes. It lets you quickly pry on the behaviour of process.[Julia Evans](http://jvns.ca/blog/2015/04/14/strace-zine/) has written a very nice and fun introduction on how to use strace. 

Let's look at this simple execution 

```bash
$ time ls -R ~> files.txt
$ time strace -c ls -R ~> files.txt #aggregates all sys calls 
$ time strace -c ls -R ~> /dev/null
```  

Now after looking at results, our first command performs twice as fast as the second one. And third one is taking slightly greater time than second one. 

Reason for first observation is that strace uses **ptrace** to track all system calls of process by making target process a child.
So that essentially is the cause of the delay

```bash
$ time strace -c strace -c strace -c ls -R ~ > files.txt &
$ ps aux | grep strace 

18193  strace -c strace -c strace -c ls -R /home/ronak
18195  strace -c strace -c ls -R /home/ronak
18197  strace -c ls -R /home/ronak
```    
Time in above is 5x more than our first command. Now for second observation, it is just that it takes a little longer to write to /dev/null, because time consumed by *open and fstat* system call is considerable to that of getdents, which was not the case with previous one. 

## Useful options 

``` 
-f trace the forked children too
-e trace=open,close trace particular system calls 
-s 800 maximum string length
-p pid trace already running process 
-o outputs to file
-y print in verbose mode
-yy print a network process in verbose mode, and replaces with ip
```

## Another Experiment 

*Here I run strace to know firefox behavior for 20 seconds to get different statstics.*

#### firefox doing nothing, but opening resore tab
```
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 99.88    0.016000         348        46           poll
  0.12    0.000020           0       123         4 stat
  0.00    0.000000           0        12           read
  0.00    0.000000           0         2           write
  0.00    0.000000           0        60           mprotect
  0.00    0.000000           0         3           munmap
  0.00    0.000000           0       637           madvise
  0.00    0.000000           0        49        48 recvmsg
  0.00    0.000000           0        10           getrusage
  0.00    0.000000           0         7           futex
  0.00    0.000000           0         1           restart_syscall
------ ----------- ----------- --------- --------- ----------------
100.00    0.016020                   950        52 total
```

#### firefox opening a [static page](https://researchweb.iiit.ac.in/~ronak.kogta) and doing simple browsing  

```
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 78.51    0.040321           4     10484           poll
 20.47    0.010515           2      5309       189 futex
  0.50    0.000259           0     31280           mprotect
  0.28    0.000146           0      2149           writev
  0.11    0.000055           0      4224           madvise
  0.05    0.000027           0     13018     10468 recvmsg
  0.04    0.000023           0      1233         6 read
  0.03    0.000014           0       278       113 stat
  0.00    0.000000           0       268           write
  0.00    0.000000           0        43           open
  0.00    0.000000           0        40           close
  0.00    0.000000           0        32           fstat
  0.00    0.000000           0       212           mmap
  0.00    0.000000           0       111           munmap
  0.00    0.000000           0        11         5 access
  0.00    0.000000           0         1           clone
  0.00    0.000000           0         1           uname
  0.00    0.000000           0        20           fcntl
  0.00    0.000000           0      1884           getrusage
  0.00    0.000000           0         1           restart_syscall
------ ----------- ----------- --------- --------- ----------------
100.00    0.051360                 70599     10781 total
```

#### firefox for a [dynamic site](https://facebook.com) and doing simple browsing  

```
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 86.31    0.141678           5     25933      2597 futex
 13.40    0.021994           1     21125           poll
  0.24    0.000402           0    232768           mprotect
  0.02    0.000038           0     30546           madvise
  0.01    0.000013           0     23535     21019 recvmsg
  0.01    0.000010           0      9280           getrusage
  0.00    0.000006           0      2764         4 read
  0.00    0.000000           0      1656           write
  0.00    0.000000           0        17           open
  0.00    0.000000           0        17           close
  0.00    0.000000           0       138         4 stat
  0.00    0.000000           0        13           fstat
  0.00    0.000000           0       709           mmap
  0.00    0.000000           0       207           munmap
  0.00    0.000000           0      2081           writev
  0.00    0.000000           0         1           clone
  0.00    0.000000           0        12           fcntl
  0.00    0.000000           0         1           restart_syscall
------ ----------- ----------- --------- --------- ----------------
100.00    0.164141                350803     23624 total
```

#### Analysis
Looking at dynamic site vs static site, there is a huge difference between number of system calls. Dynamic sites have more interacting components runnning and constantly receiving  messages and using futex to  ensure some kind of ordered state.  Also poll requests increase considerably. You can also see lot of errors in recvmsg, which checks out as we are using tcp, and packets may fail due to several reasons, but delivery guarantees are met by sending packets again and again.


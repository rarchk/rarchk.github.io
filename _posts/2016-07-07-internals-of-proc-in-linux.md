---
layout: post
title: Internals of /proc in linux
type: blog
tags: [linux]
categories: [development]
---

{% highlight bash%}
/proc
├── Process Directories(PIDs) (contains info about particular process)
├   ├ fd/ -- directory of allfile descriptors
├ 	├ maps 
├ 	└ stat, statm, status -- process realted info
├	 
├── {self,bus,fs,driver,scsi,tty}
├	
├
├── net (System network statistics)
├ 	├ arp 																	
├ 	├ tcp,udp,igmp, snmp, sockstat, unix (protocols)
├ 	├ netstat, iptables, route (statistics)
├	├ dev,wireless (device info)
├   
├── irq set IRQ to CPU affinity, which allows the system 
├		to connect a particular IRQ to only one CPU
├
├── sysvipc relates to System V IPC calls for messages (msg),
├			 semaphores (sem), and shared memory (shm).
└
{%endhighlight%}    

---
layout: post
title: Internals of /proc in linux
type: blog
tags: [linux]
categories: [systems]
---
**/proc** is a temporary filesystem which keeps track of all running processes and resources consumed by them. It also keeps track of system-wide resource limits and stats in different files. Various commands like *ps,top,vmstat etc*, parse this fs for appropriate results. 

```
/proc
├── Process Directories(PIDs) (contains per process info)
├   ├ fd/ -- directory of allfile descriptors
├   ├ maps 
├   └ stat, statm, status -- process realted info
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
├ 		to connect a particular IRQ to only one CPU
├
├── sysvipc (relates to System V IPC calls for messages (msg),
├		semaphores (sem), and shared memory (shm)).
├
├── sys (keeps system wide resource limits, 
├ 		like pidmax,threadmax,filemax)
├
			
```    

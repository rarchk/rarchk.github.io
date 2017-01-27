---
layout: post
title: Latency Numbers That Every Software Programmer Should Know
type: blog
tags: [optimization,design]
categories: [systems]
---
Latency in simple words, can be defined as time elapsed between a response and stimulus. For example, for an action **A**, if appropriate response is **B**, then latency is equal to *time between the occurrence events A and B*. 

Discussion of latency in system design is important, as it affects business goals<sup>**[1](http://radar.oreilly.com/2009/06/bing-and-google-agree-slow-pag.html)**</sup> as well as effectiveness of system<sup>**[2](http://blip.tv/file/2290648)**</sup>. Following numbers are rule of thumb metrics in system design, and it might help in some way.    

## Memory Latency Numbers
Memory in general is a critical resource, and in computer systems there exists different kind of memories. In general, faster memories are smaller and costlier to implement, and slower memories are more economical. An ideal balance between these memories can define performance and throughput of your system.   

| Memory | Time | 
|:---:|:---:|
|L1 Cache Reference | 1ns|
|L2 Cache Reference |4 ns|
|Main Memory Reference | 100 ns|
|SSD Random Read |0.16 ms|
|SSD Sequential 10000 bytes Read |0.6 ms|
|Magnetic Disk Random Read | 3 ms | 
|Magnetic Disk Sequential 10000 bytes read | 1 ms|

## Network Latency Numbers
Latency numbers for a round trip of a packet in network 

|Context|Time|
|:---:|:---:|
|Within datacenter | 0.5 ms|
|Between Netherlands and California | 150 ms |

## Programmatic constructs and their latency 

|Programmatic Context|Time|
|:---:|:---:|
|Branch mis-predict| 3 ns|
|Locking | 17 ns |

## Web Latency Numbers

While designing a website or an app, one should understand the critical latencies of end-user so that he/she could effectively use the service that you are providing

|User Perception | Delay |
|:---:|:---:|
|Feels Instantaneous |0-110ms|
|Small Perceptible Delay | 100-300ms|
|Machine is working |300-1000ms|
|likely a context switch| >1s |
|loses you|>10s|




## References 
1. [Berkeley Latency numbers](https://people.eecs.berkeley.edu/~rcs/research/interactive_latency.html)
2. [Latency is Everywhere and It Costs You Sales and How To Crush It](http://highscalability.com/latency-everywhere-and-it-costs-you-sales-how-crush-it)
3. [Primer on Web Performance](https://hpbn.co/primer-on-web-performance/)
4. Libet found 500 msecs is about the time it takes the brain to weave together an experience of consciousness from all our sensor inputs.
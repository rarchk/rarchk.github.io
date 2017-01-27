---
layout: post
title: Latency numbers that every software programmer should know
type: blog
tags: [optimization,design]
categories: [systems, product managemnt]
---
I
## Memory Latency Numbers
Memory in general is a critical resource, and in computer systems there exists different kind of memories. In general, faster memories are smaller and costlier to implement, and slower memories are more economical. An ideal balance between these memories can define performance and throughput of your system.   

| Memory | Time | 
|:---:|:---:|
|L1 Cache Reference|1 ns|
|L2 Cache Reference|4 ns|
|Main Memory Reference| 100 ns|
|SSD Random Read|0.16 ms|
|SSD Sequential 10000 bytes Read|0.6 ms|
|Magnetic Disk Random Read | 3 ms | 
|Magnetic Disk Sequential 10000 bytes read | 1 ms|

## Network Latency Numbers
Latency numbers for a round trip of a packet in network 

|Context|Time|
|:---:|:---:|
|Within datacenter| 0.5 ms|
|Between Netherlands and California| 150 ms |

## Web Latency Numbers

While designing a website or an app, one should understand the critical latencies of end-user so that he/she could effectively use the service that you are providing

|Brain Perception| Page load times|
|:---:|:---:|
|Feels instantaneous|0.1 sec|
|lets you think seamlessly|1sec|
|Keeps your attention barely| 10 sec |
|loses you|>10sec|

As an interesting aside, Libet found 500 msecs is about the time it takes the brain to weave together an experience of consciousness from all our sensor inputs.


## References 
1. [Berkeley Latency numbers](https://people.eecs.berkeley.edu/~rcs/research/interactive_latency.html)
2. [Latency everywhere and how to crush it](http://highscalability.com/latency-everywhere-and-it-costs-you-sales-how-crush-it)
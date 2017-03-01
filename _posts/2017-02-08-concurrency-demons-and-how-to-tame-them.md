---
layout: post
title: Concurrency demons and how to tame them
type: os
tags: [operating systems,concurrency]
categories: [systems]
---
In this blog post, I talk in detail about what are different methods to achieve concurrency in more detail. I have worked on golang, python, C and rust. So writing this post will be like writing a story. 

### Traditonal locks
**Balaban in the court**: Strict mandates and orders that needs to be followed if in case conflict happens. Workers carefully adhere to use such parameters because it is balaban court. For eg. *semphore, futex ,mutex etc.* 

#### Problem with traditonal locks
- locks don't compose
- locks break encapsulation like rand()
- taking too few/many locks
- taking wrong locks
- taking locks in wrong order
- error recovery is hard

### Atomic Locks 
**Birbal in the court**: He could intelligently divide the nature of work so that worker gets to independent from get-go. *(lockfree and waitless synchronizaiotn)*


## How Go achieves concurrency 

| Features | Go routines | OS Threads | 
| --- |:---:|:---:|
| Communication | Go channels | Shared Memory | 
| Scheduling | Cooperative | OS Scheduling | 
| Memory | Grows and Shrinks Stacks of 2KB Dynamically | 1MB of thread data structure and have to tear down or built up|
| Garbage Collector | Yes | No |
| Context Switching save/restore |PC, SP, DX| 16 GP, PC, SP, segment, 16 XMM , 16 AVX registers, FP coprocessor state, all MSRs | 
| Abstraction | Built upon threads | POSIX |			 
   

## Many other languages treat concurrency in different way 
- Erlang explicitly does not allow to share state and only communication that can happen is through messages. 
- Clojure has immutable ds, which allows it to handle concurrency in log-oriented way. 
- Rust has strong checking mechanisms, that at least detect race conditions at compile time. 

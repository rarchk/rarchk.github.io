---
layout: post
title: Concurrency demons and where to find them
type: blog
tags: [operating systems,concurrency]
categories: [systems]
---

The term *concurrency* can be traced back to famous paper, **"Communicating Sequential Processes"** by *Tony Hoare*, 1978.
> A program is a parallel composition of processes that have no shared state; the processes communicate and synchronize using channels

**Concurrency is way in which we can teach multiple processes/threads to operate together without causing conflicts.**  These processes can communicate together via 

- operating on shared state
- Communicate via messages (Actors)
- Software Transactional Memory
- Data flow concurrency 
- Events and triggers 

![Concurrency](https://rarchk.github.io/public/images/concurrency.jpg)

But before we dive into how to achieve concurrency, let's dig into the problems that might occur if we just nonchalantly
write a program.    

## Race Conditions
When different actors operates simultaneously on a state or a variable and are allowed to change and modify it. Following problems may emerge.   

- Order Violation (Desired order of execution is not enforced)
- Atomicity Violation (Desired serializbility of memory access is not enforced )

### Solution 
**Critical Section**: A piece of program code, which must be executed in serialized and mutually exclusive way. 

Access to this piece of code must be serialized. In order to do that we may do following 

- locks, semaphores, atomic instructions etc. 

## Deadlocks
*This situation arises when a process request for resource which is acquired by another resource, meanwhile it does not release the resources that it already acquired leading to the state of deadlock.
*

**A deadlock situation can arise only if all of the following conditions hold simultaneously in a system**

- A process has an access to a mutual exclusive resource
- A process is allowed to hold some resources and wait for others.
- OS cannot preempt resources that have been acquired by a process.
- Process A is waiting for a resource that is held by process B, meanwhile process B is waiting for process A to release the resource. (Circular Wait)   

### How to deal with deadlocks
- **Deadlock Prevention Algorithms** (idea is to break one of these conditions)
  + partial ordering or ordering (Circular wait)
  + Acquire all locks all at once (Hold and Wait)
  + TryLock (Preemption) (removes deadlock but livelock can still happen)
  + Lock free instruction with atomic updates (Mutual Exclusion)

- **Deadlock Avoidance Algorithms** (awareness of a global state is required)
  + Scheduling (A scheduleer can know lock patterns, but you have to know beforehand)

- **Deadlock Detection Algorithms**
  + Periodically OS may run a deadlock detection algorithm and imporvise the deadlock recovery methods
  + OS may create a resource allocation graphs, and check for deadlocks, and preempt.    

### Dining Philosophers Problem
Big Mom had 4 sons, and they all became philosophers. 4 Philosophers kids are sitting on a round table to eat, with one fork lying in between them. But true to their nature,
they can chose to think and dine. But Big Mom was fed up with this behavior and imposed a condition on dining
- A philosopher kid can only eat when he picks both forks lying beside his left and right.    
- Philosopher Kids do not contact with each other, their actions are irrespective and anybody can pick fork anytime.

#### Solutions
- pick left fork, and check for right fork, if not available release left fork
- arbitrator lock
- partial ordering
- actor models
- clean/dirty forks
- leaving the table  

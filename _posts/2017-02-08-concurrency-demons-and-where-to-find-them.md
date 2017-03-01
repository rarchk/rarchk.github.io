---
layout: post
title: Concurrency demons and where to find them
type: os
tags: [operating systems,concurrency]
categories: [systems]
---

The term *concurrency* can be traced back to famous paper, **"Communicating Sequential Processes"** by *Tony Hoare*, 1978.

> A program is a parallel composition of processes that have no shared state; the processes communicate and synchronize using channels

In current world, **Concurrency is way in which multiple resources can be interleaved or co-operate together without causing any conflicts.**These resources can be multiple threads trying to write into a file, or one process handling multiple files simultaneously. Basic mechanisms by, which they can co-ordinate are  

- Operating on the shared state
- Communicate via messages (Actors)
- Software Transactional Memory (If yes, then commit all the way through, otherwise reject)
- Data flow concurrency 
- Events and triggers 

However, writing a concurrent program is hard, and every method comes up with a limitation of its own. Before we dive into individual methods, it is important to know the general nature of issues that come while writing such a programs. 

## 1. Race Conditions ##
When different actors operates simultaneously on a state or a variable and are allowed to change and modify it. Following problems may emerge.  

- *Order Violation* (Way in which actors operate cannot be deterministic and may lead to different results every time they run)
- *Atomicity Violation* (Way in which resource are handled by operators is also not deterministic )

### *Solution*  ###
*Serialized Access* is one of the proposed solution for this problem. 

- If multiple actors are acting up on a resource, then access to that resource must be serialized. *(Linearizability)*
- Each actor at some point should get access to this resource while no body else can access it. *(Mutual Exclusion)*
 
There are bunch of ways in which this can be solved: 

- Locking the piece of code, also called as critical section of the code, and let actors work on it by asking for locks. (pthreads in C)
- Messages are another way, where actor does not share anything with each other and talks in term of messages. (Erlang processes)
- Atomic instructions, where simultaneous actor requests for a change, but change happens in one lock step. So thereby making it thread safe feature. 

## 2. Deadlocks ##
*This situation arises when a process request for resource which is acquired by another resource, meanwhile it does not release the resources that it already acquired leading to the state of deadlock.*

**A deadlock situation can arise only if all of the following conditions hold simultaneously in a system**

- A process has an access to a mutual exclusive resource
- A process is allowed to hold some resources and wait for others.
- OS cannot preempt resources that have been acquired by a process.
- Process A is waiting for a resource that is held by process B, meanwhile process B is waiting for process A to release the resource. (Circular Wait)   

### **Methods** ###
- **Deadlock Prevention Algorithms** (idea is to break one of the above conditions)
  + partial ordering or ordering (breaking the Circular wait)
  + Acquire all locks all at once (breaking the Hold and Wait)
  + TryLock (Preemption) (removes deadlock but live-lock can still happen)
  + Lock free instruction with atomic updates (breaking Mutual Exclusion)

- **Deadlock Avoidance Algorithms** (awareness of a global state is required)
  + Scheduling (A scheduler can know lock patterns, but you have to know beforehand)

- **Deadlock Detection Algorithms**
  + Periodically OS may run a deadlock detection algorithm and improvise the deadlock recovery methods
  + OS may create a resource allocation graphs, and check for deadlocks, and preempt.    

#### **Classic Dining Philosophers Problem** ####
Big Mom had 4 sons, and they all became philosophers. 4 Philosophers kids are sitting on a round table to eat, with one fork lying in between them. But true to their nature,
they can chose to think and dine. But Big Mom was fed up with this behavior and imposed a condition on dining
- A philosopher kid can only eat when he picks both forks lying beside his left and right.    
- Philosopher Kids do not contact with each other, their actions are irrespective and anybody can pick fork anytime.

#### **Solutions** ####
- pick left fork, and check for right fork, if not available release left fork
- arbitrator lock
- partial ordering
- actor models
- clean/dirty forks
- leaving the table  

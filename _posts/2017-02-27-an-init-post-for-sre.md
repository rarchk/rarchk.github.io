---
layout: post
title: An init post for SRE
type: blog
tags: [sre,linux,programming,thoughts]
categories: [systems]
---


This year, I have a goal. I want to understand different aspects of building, maintaining and running large scale systems. There are bunch of things, that I should be able to argue about

- Trade-offs of system design choices that were made, and way of evaluating them periodically with the help of tools and existing practices like benchmarking and load testing. 
- Defining the process of how *updates/new features* in product make it to the end-users or customers.
- Understanding the ways of handling arbitrary workload requests and errors like excess traffic, downtime etc.   

Fortunately, there is something called **Site Reliability Engineering**, which deals with the things that I mentioned above. I've decided to pursue my career in this direction. An SRE can typically strive to fulfill minimal [needs of systems](https://plus.google.com/+lizthegrey/posts/MLAJFVyEb2f) first, and gradually grow up one ladder in [Maslow's hierarchy](https://en.wikipedia.org/wiki/Maslow%27s_hierarchy_of_needs) of systems.


{: align="center"} 
![Dickerson's Hierarchy of reliability](https://rarchk.github.io/public/images/sreHierarchy.png){: width="85%" height="auto"}  

## So, What is SRE ? 
SRE is famously an engineering position defined in Google, and a more concrete definition of SRE can be deduced from famous [Google's SRE book](http://landing.google.com/sre/book.html). But basically an SRE is person who can argue on most of these arguments.  

- Can you make your systems fault tolerant.  
- Can you recover or successfully diagnose the cascading failures .
- Have you thought about the capacity planning of your system components.  
- What are strategies and workflows you would employ to manage or recover from disasters.
- Every design choice has its trade offs. A proper understanding of these trade offs will help you reducing the uncertain aspects of your system.      
- Can you write a maintainable, production ready and flexible code for your systems.

### So what are good practices for an SRE engineer ? 
Well, there are different approaches to become good engineer, and you should follow the path which fits your style well. These are some of things, that I've been trying to follow.

- Brevity of thought and clarity of systems can help you argue about different trade offs of your choices without getting frustrated.
- Learn to ask [right questions](https://jvns.ca/blog/good-questions/). Questions will help in parsing the clutter of a problem, and may help you in getting the root cause.  
- [Preparing a checklist](https://www.usenix.org/conference/srecon16/program/presentation/gregg), or thoroughly organizing your thoughts while trouble-shooting. Keep noting things in a diary. 
- Multiple problems exist in system at any point of time. *But important parameter is  prioritizing one thing over the other.*    
- Read system blogs and write some, if you can. 
- Conferences like SREcon or LISA are a good source of learning different aspects of operations and SRE. May be, *strive yourself to share that kind of knowledge to the world.*   	     


### Some excellent articles, I would recommend that every wannabe SRE should read:

1. [Log: What Every software engineer should know about real time data](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)
2. [How linux networking stack receives data](https://blog.packagecloud.io/eng/2016/06/22/monitoring-tuning-linux-networking-stack-receiving-data/)
3. [How linux networking stack sends data](https://blog.packagecloud.io/eng/2017/02/06/monitoring-tuning-linux-networking-stack-sending-data/)
4. [The secret to C10M problem](http://highscalability.com/blog/2013/5/13/the-secret-to-10-million-concurrent-connections-the-kernel-i.html)
4. [10 Things I learned making the fastest web site](https://hackernoon.com/10-things-i-learned-making-the-fastest-site-in-the-world-18a0e1cdf4a7#.pzq4p31ec)
5. [Julia Evans](http://jvns.ca/) writes great short blogs on her discovery of system things. They are fun and insightful to read.  
6. [Brendan Gregg](http://www.brendangregg.com) is one person you should follow, if you like to know about performance of your system components. 
7. [High Scalability](http://highscalability.com/) is a great blog on systems. Make it must in your reading list.


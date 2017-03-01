---
layout: post
title: On my path to become backend engineer 
type: blog
tags: [sre,survey,performance]
categories: [systems]
---


## Solving system design problems to get an overview of different concepts
- how do you design overlay networks 
- design distributed key-value store, highly availiable database, highly availiable cluster
- How timestamping is done in distributed systems? Explain Vector clocks and ntp. 
- Explain DNS, TCP/IP, BGP, UDP, Protocol Buffers
- Explain the need of padding and alginment in our context?
- Briefly describe the log oriented design thinking ? 
- golang goroutines and channels implementation 
- lru cache implementation and discussion of scheduling algorithms 
- writing fair uber stack on etherium
- design memcache, redis and a simple client-server socket 
- Clojure persistent data structures 
- rust saftey features 
- how regular expression works in perl 
- Evernym,Nikki.ai questions  
- what is anycast, multicast. 
- design a garbage collector or a web crawler

# Understanding of concepts 
- Paxos, Raft and Consensus algorithms 
- Different frameworks 
	- Document stores 
	- Columnar stores 
	- Graph stores 
	- RPC frameworks 
	- Monitoring
	- Distributed Tracing 
	- Continious Integration and Continious Deployment 
	- Queuing Gurantees and different frameworks 
	- Stateful horizontally scalable clusters 
	- Memcache, Varnish
	- Revese Proxying and Proxying   

- CAP 
- ACID (Atomicity,Consistency,Isolation,Durability)
- BASE (Basically Available, Soft state  Eventually consistent) 
- Replication and Sharding 
- Postmortem analysis 
- Performance analysis 

# Build Simple Systems and apply symian army to tweak and troubleshoot systems 
- Build a web server with multiple instances and simple database with CP 
	- provision servers 
- CI/CD deployments to test out testing. 
- Infrastructure as a code 
- More analysis on development and debugging tools that you use  

# Start Blogging and follow Technical blogs 
- Linkedin,Docker,Dropbox,Facebook,Soundcloud,Netflix and others 
- kickstarter,cloudflare,google
- https://codeascraft.com/

# Understanding the mentality of your interviewer
- check out his profile, and kind of work he has been doing. Based on that context, just figure out what kind of tools, and questions he may or may not ask.

# Systems 
- Abstraction and layers are important. You must be able to define what part of system that you want to expose and what not. 
- Order analysis of algorithms is important 
	- hash tables, sorting, heaps, graphs, dynamic programming, trees
	- bloom filters, string algortihms,  
- os, database, network
# Work Ethics 


## SRE engineer typical responsibilites 
- Can scale up, roll back, redirect traffic 
- must cope under pressure 
- quick resolution 
- spot the difference from good to bad state from looking at dashboards
- chat rooms pager ticket systems 
- central event logs 
- distributed system tracing 


## Why to prepare checklists 

- Start, End points 
- Speed and Completeness 
- Reliablity and Training   

What should sre know 

- Fault tolerance 
- Cascading failures 
- Capacity planning 
- Disaster recovery
- Understanding Performacne trade offs 
- Masters of production systems 

SkillSets 

- General linux skill sets 
- low level systems knowledge 
- Can you precisely talk the how systems work 
- Tradeoffs with different architecture
- Trouble shooting - logical thinking,depth of knowledge
- 

Evaluation 

- Whiteboard, take home test or laptop 
- Can a candidate express a complicated idea without getting frustated 
- Architecture and questions 
	- what is the purpose 
	- do it follows the model of something popular 
	- how resources are shared 
	- are there gonna be acl/ or shared 
	- these questions allow you to talk about trade off 
	- keep your architecture and design simple, is it flexible 
- Trouble shooting 
	-

Deciding to hire 

- put your thoughts 
- what is your role, understand that role well and keep everybody on same page
- 	    

Hardware Counters, Tracepoints, Ptrace, Kprobes, Kernel modules 


Metrics used 
=== 
SPS (Starts per second)
QPS (Queries per second)
Load, Errors, Latency, Saturation, Instances 


![Dickerson's Hierarchy of reliability](public/images/HierarchyofReliability.svg)
## References 
- 
- 
- 
- []() 
- https://www.usenix.org/conference/srecon15/program/presentation/serebryany
- https://www.infoq.com/news/2017/01/scaling-twitter-infrastructure?utm_source=infoq&utm_medium=related_content_link&utm_campaign=relatedContent_news_clk
- https://www.infoq.com/articles/future-serverless?utm_source=articles_about_Devops&utm_medium=link&utm_campaign=Devops
- https://www.infoq.com/articles/chaos-engineering?utm_source=articles_about_Devops&utm_medium=link&utm_campaign=Devops
- http://blogs.atlassian.com/2016/02/inside-atlassian-sre-use-chatops-run-incident-management/
- https://martinfowler.com/articles/continuousIntegration.html
- Spinnaker google cloud waze 
- https://read.acloud.guru/evolution-of-business-logic-from-monoliths-through-microservices-to-functions-ff464b95a44d#.sc37bbhe8
- https://cloudplatform.googleblog.com/
- https://charity.wtf/2016/05/31/wtf-is-operations-serverless/
- 

## Companies 
- netflix 
- facebook 
- google 
- 

Interview 

1. Technical Interview - 45 min

	- Abstraction & Design
		- inheritance, polymorphism, encapsulation 
	- Algorithms & Data Structures
	- Software Engineering
		- polyglot 
		- extreme programming 
		- pair programming 
		- models
		- scrum  

2. Technical Interview - 45 min

	- Architecture & Systems Design
	- Networking
	- Databases
	- APIs

3. Technical Interview - 45 min

	- Reliability & Operations
	- Configuration Management
	- Monitoring
	- Troubleshooting and Debugging
	- Documentation

4. Hiring Manager Interview - 45 min

	- Culture
	- Values
	- Goals
	- Feedback


## 10M concurrent connections 
- Don’t let the kernel do all the heavy lifting. Take packet handling, memory management, and processor scheduling out of the kernel and put it into the application, where it can be done efficiently. Let Linux handle the control plane and let the the application handle the data plane.

- Following applications might need 10M connections (IDS/IPS, DNS root server, TOR node, Nmap of Internet, video streaming, banking, Carrier NAT, Voip PBX, load balancer, web cache, firewall, email receive, spam filtering)

- packet scalability, multicore scalability, memory scalability 
-


---
layout: post
title: Internals of Linux Container
type: blog
tags: [linux,containers]
categories: [development]
---
###Linux Containers 
- OS level virtualization method(Light weight virtualization)
- Process Isolation + Resource Management + Security
- Technologies:*Namespaces,cgroups,selinux*

###Types of containers

- Shared OS
	- generic application container 
	- systemd application container 
- Unshared OS
	- chroot application container
	- booted os container

Containers and KVM virtualization differs in the level of abstarction they provide.

###Namespaces
Partition of essential kernel system structures to create virtualized environments. In other words, purpose of each namespace is to wrap a particular global system resource in an abstraction that makes it appear to the processes within the namespace that they have their own isolated instance of the global resource. Currently there are 6 kind of namespaces in linux kernel 

1. pid namespace 
2. mounts namespace
3. UTS namespace
4. IPC namespace 
5. net namespace
6. user namespace  

{% highlight bash %}
$ cat /proc/<pid>/ns # a new process inherits its parent's namespace
$ man 2 {clone(), unshare(), setns()}
{% endhighlight%}


####Mount namespace

- isolate the set of filesystem mount points seen by a group of processes. 
- processes in different mount namespaces can have different views of the filesystem hierarchy. 
- mount namespaces can create environments that are similar to chroot jails.	

####UTS namespace 
- isolate two system identifiers—nodename and domainname—returned by the uname() system call;

####IPC namespace
- isolate IPC resources, namely, System V IPC objects and POSIX message queues.

####PID namespaces
- isolate the process ID number space. 
- Processes in different PID namespaces can have the same PID. 
- There will be two pid of a process, one that is in a namespace, and one global pid running on the host. 
 
####Network namespaces
- provide isolation of the system resources associated with networking. 
- Each network namespace has its own network devices, IP addresses, IP routing tables, /proc/net directory, port numbers, and so on.

####User namespaces

- isolate the user and group ID number spaces.

###Seccomp
- allows a process to make a one-way transition into a "secure" state where it cannot make any system calls except exit(), sigreturn(), read() and write() to already-open file descriptors.
- Should it attempt any other system calls, the kernel will terminate the process with SIGKILL. 
- It does not  virtualize system resources but isolates the process from all. 
{% highlight bash %}
$ man 2 prctl() # Enabled by seccomp
{% endhighlight%}
 

 
###Cgroups
Feature to limit, police and account the resource usage of process groups. 

- Resources like cpu, memory, disk I/O etc, can be allowed as well as denied to a group of system, if needed be.
- Facilities to prioritize, accounting and controlling a system is available.  
- Compared to other approaches like the 'nice' command or /etc/security/limits.conf, cgroups are more flexible.
- everything exposed through a vfs: /cgroup




###Use cases

-  unprivileged processes can create user namespaces in which they have full privileges, which in turn allows any other type of namespace to be created inside a user namespace. [user]
- containers can be migrated between hosts while keeping the same process IDs for the processes inside the container [pid]
- each container can have its own (virtual) network device and its own applications that bind to the per-namespace port number space; suitable routing rules in the host system can direct network packets to the network device associated with a specific container. Thus, for example, it is possible to have multiple containerized web servers on the same host system, with each server bound to port 80 in its (per-container) network namespace.[network]
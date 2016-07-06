---
layout: post
title: Internals of Linux Container
type: blog
tags: [linux,containers]
categories: [development]
---
-  unprivileged processes can create user namespaces in which they have full privileges, which in turn allows any other type of namespace to be created inside a user namespace. [user]
- containers can be migrated between hosts while keeping the same process IDs for the processes inside the container [pid]
- each container can have its own (virtual) network device and its own applications that bind to the per-namespace port number space; suitable routing rules in the host system can direct network packets to the network device associated with a specific container. Thus, for example, it is possible to have multiple containerized web servers on the same host system, with each server bound to port 80 in its (per-container) network namespace.[network]

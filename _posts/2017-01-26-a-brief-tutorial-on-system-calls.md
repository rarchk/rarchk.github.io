---
layout: post
title: A Brief Tutorial on System Calls
type: blog
tags: [linux,operating systems,system call]
categories: [systems]
---
There exists three ways in which we can talk to kernel 

- system calls 
- traps
- exceptions 

System calls are kind of macro instructions which a user program asks kernel to execute on its behalf. A system call may be needed to read/write files, open some network sockets or create some child process. 

Generally speaking, a user program does not directly invokes system call, but uses a tiny library wrapper which does the following

*  copying arguments and the unique system call number to the registers where the kernel expects them;

*  trapping  to kernel mode, at which point the kernel does the real work of the system call;

*  setting errno if the system call returns an error number when the kernel returns the CPU to user mode.

Some system calls may not have wrappers defined, so we can use *syscall(2)* to define a wrapper for them. 

### Control flow of System Calls
```
---------------------------------------------
H/W Interface __ Kernel Space  __ User Space
 (Resources)	 (System Call)      ( API )
---------------------------------------------
```
###How System Call works ? 
- System call executes in the kernel mode, and every call has a syscall number associated with them. For more information, check out */usr/include/asm/unistd.h*

- In Kernel sys_call_table, these numbers are stored. So when a system call is issued, the respective   
   number is passed on to the kernel

- User program issues a system call via issuing a trap to the OS by executing INTerrupt 0x80 

- sys_call_num is passed by pusing value to the EAX register and respective arguments are  passed via 
  other registers (EBX, ECX, etc.) Results are returned, using the same registers.






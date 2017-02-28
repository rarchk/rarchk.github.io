---
layout: post
title: CUDA Architecture at glance
type: blog
tags: [cuda,gpgpu,architecture]
categories: [systems]
---

Seemingly, GPGPU are things of present. This wonderful architecture expressively allows you to do *data parallelism* at very fast rates. 

And as a result, they are used in deep learning, simulations and other compute intensive work, which can be modelled into *data-parallel kernels* of code.   

## GPGPU Architecture

Typically, GPU was optimized for image processing and gaming, where there were ton of small and independent problems, that needs to be solved on same data/image. The CPU was not good fit, as it has only limited number of cores, and its architecture is more generic to compute different kind of things. For this kind of workload, we require something like lots of **Intel MMX** hardware units.

Below is the **NVIDIA FERMI GPU** architecture  

```
streaming multiprocessors (SMs) (24 in Fermi)
├
├──Each SM containing eight streaming processors (SPs), or cores
	├
	├──Each SP executes a program on a warp
	   of 32 threads simultaneously. (SPMD)
		├
		├── multiply-add arithmetic unit
		├
		├── two special functional units (SFUs)
		├
		├── reciprocal square root, sine, and cosine
		├
		├── fully pipelined		
		├
		├── Arithmetic Peak(8 Tb/s)
```
 

GPU is treated as a coprocessor that takes functions as input. These functions are called Kernels. A Kernel is stand alone unit where you define the data it consumes, its interactions with CPU and how it is going to use CUDA architecture. 

```
Each kernel creates a single grid
	|
	|-- A grid consists of many thread blocks.
	 	(each block on one SM)
		|
		|--Threads in a block are organized into
		   warps of 32 threads.
		|
		|-- Each warp executes in SIMD fashion, issuing in
		    four cycles on the eight SPs of an SM. When
		    one warp stall, SM switch to another warp
```
Next thing on agenda is the memory architecture of GPGPU. Just like cache,RAM,disk in CPU, GPGPU enjoys a nice hierarchy of memory. 

```
Memory Hierarchy 
|
|-- Host-To-Device Memory(BW -- 6GB/s) 
  |
  |--Global Memory(RW)[offchip memory](200-300 cycles , BW:177 GB/s)
  |
  |--Texture Memory(R)[on-chip cache](>100 cycles)
     |
     |--Constant Memory(R)[on-chip cache](Register latency)(Per SM) 
     |
     |--Shared Memory/Register File(RW)(Per SM)
        (Register latency)(BW -- 1.3Tb/s)
```

There are multiple ways to transfer data to GPGPU

```
Memory Transfer 
	|
	|--Device Memory 
	|
	|--Pinned Memory
	|
	|--Zero-copy
	|
	|--device-to-device memory
```

## How your code runs on GPGPU
The user supplies a both host (CPU) and kernel (GPU) code. Codes are separated and compiled by gcc and GPGPU specific compiler.

Now once it has been compiled and started, host transfers data to GPU’s and initialize the kernel code via API calls

```
CPU Thread (may wait or not) always launches a new kernel 
├
├── Grid (of blocks in 1,2,3 dimensions) 
	invoked when kernel starts, 
	├
	├── Block (of threads in 1,2,3 dimensions), 
		all blocks are independent 
		├
		├── Warp (of 32 threads) execute simultaneously

```

Check out some the [GPGPU sample codes](https://github.com/rarchk/HPCtute/tree/master/cuda), and try to have fun with the amazing architecture.


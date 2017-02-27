---
layout: post
title: CUDA Architecture at glance
type: blog
tags: [cuda,gpgpu,architecture]
categories: [systems]
---

## Abstract overview

- GPU is treated as a coprocessor that executes data-parallel kernel functions
- The user supplies a both host (CPU) and kernel (GPU) code
- Codes are separated and compiled by NVIDIA’s compiler.
- Host code transfers data to GPU’s and initialed the kernel code via API calls

## Architecture 
Nvidia Fermi Architecture is collection of many processors and different memories. So, to make things 
simple, we have abstracted the essential details in form of compute, memory and workflow hierarchies. 

### How compute units are organized ?  
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

### What is the memory hierarchy and how memory interacts with OS; 
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

### How work is internally organized in CUDA cores
Control in gpu kernels is principally configured via threads, and threads too have a hierarchy

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

### Functional workflow 

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

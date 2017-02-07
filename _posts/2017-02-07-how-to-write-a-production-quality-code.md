---
layout: post
title: How to write a Production Quality code
type: blog
tags: [software engineering,productivity]
categories: [systems,programming]
---

Recently, I got to know some limitations in my coding style. It was not production quality code, even though as a developer I took care of all the edge cases and optimized it to use multiple threads. As a result, I started asking my friends for reviews on my code, and got interesting insights on my coding habits.    

- Read parameters from a configuration file or list or environment variables, every time you can.  
	- hard coding is bad in production code, as it makes hard to grasp the details of hard coding. If things are all in place, changing configuration settings or understanding context is much easier. Here usage of variable names also causes confusion. *Proper variable names and good configuration parameters handling* is first key to write good production code.  

```python
# Removing Anchors
link = link.split('#')[0];

# Removing Query on pages "?"
link = link.split('?')[0]; 
```	 

- Emphasis on code re-use. Do not try to reinvent wheel 
	- **"I'm a developer and I should build it from scratch."**, is not a good way build robust systems. Code Re-use, Modularity and white spaces are things that a developer should focus on while writing a correct and optimized code. 
	- Using a battle tested and a mature piece of software component will give you much predictable results than writing your code from scratch.

- Follow style guides of respective languages.

- Do similar things in similar ways and keep it simple and stupid (KISS)


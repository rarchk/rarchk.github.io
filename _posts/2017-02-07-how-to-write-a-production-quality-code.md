---
layout: post
title: How to write a Production Quality code
type: blog
tags: [software engineering,productivity]
categories: [systems,programming]
---

Recently, I got to know some limitations in my coding style. It was not production quality code, even though as a developer I took care of all the edge cases and optimized it to use multiple threads. As a result, I started asking my friends for reviews on my code, and got interesting insights on my coding habits.    

### Read parameters from a configuration file or environment variables, every time you can ###  
Hard coding is bad in production code, as it makes hard to grasp the details of that attribute. If things are all in a place, changing configuration settings or understanding context is much easier. Below code is an example of hard coded operations on the strings and file type it may represent. Even though it is commented, an outside programmer might not know what is link and might get confused. It is better to define permissible file types in the config file and let you code work through.   

```python
# checking file types links and adding '/' in the end for html links
if(len(link.split('pdf'))>1 or len(link.split('ppt'))>1):
	a = 'Do nothing'		
elif(link[-1]!="/"):
	link = link+"/"

```	 

### Emphasis on code re-use. Do not try to reinvent wheel ###
**"I'm a developer and I should build it from scratch."**, is not a good way build robust systems. Code Re-use, Modularity and white spaces are things that a developer should focus on while writing a correct and optimized code. 

Using a battle tested and a mature piece of software component will give you much predictable results than writing your code from scratch. And also it is faster. 

### Using style guides and descriptive variables ###
Every language has its own style guide, which is marked for clear readability and understanding. Following them is one definite step to write a production code. 

### Do similar things in similar ways and keep it simple and stupid (KISS) ###
- Modularize your code into short pieces of function that achieve one purpose 
- Code should be extensible but should not increase complexity by making one part effective.  


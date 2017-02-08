---
layout: post
title: How to write a Production Quality code
type: blog
tags: [software engineering,productivity]
categories: [systems,programming]
---

Recently, I got to know some limitations in my coding style. Even though, *as a developer*,  I wrote an optimized code with most of the edge cases covered, the question was whether it could be read or may be extended by another programmer/ developer. 

Well, in my case, that another programmer would have slight difficulty. So I asked my friends to review my code, and they gave me some pointers.       

## Read parameters from a configuration file or environment variables, every time you can ##  
Hard coding is bad in production code, as it makes hard to grasp the details of that attribute. If things are all in a place, changing configuration settings or understanding context is much easier. Below code is an example of hard coded operations on the strings and file type it may represent. Even though it is commented, an outside programmer might not know what is link and might get confused. It is better to define permissible file types in the configuration file and let you code work through.   

```python
# checking file types links and adding '/' in the end for html links
if(len(link.split('pdf'))>1 or len(link.split('ppt'))>1):
	a = 'Do nothing'		
elif(link[-1]!="/"):
	link = link+"/"

```	 

## Emphasis on code re-use. Do not try to reinvent the wheel ##
**"I'm a developer and I should build it from scratch."**, is not a good way build robust systems. Code Re-use, Modularity and white spaces are things that a developer should focus on while writing a correct and optimized code. 

Using a battle tested and a mature piece of software component will give you much predictable results than writing your code from scratch.

In below example, I thought it would be cool to show off my regular expression skills, but it took me a lot longer to get through this stage, and even after that I did not had all edge cases covered. If I had used lxm, or BeautifulSoup to parse, then I could focus on core parts of my application 

```python 
# import bs4,lxml
import re
```

## Using style guides and descriptive variables ##
Every language has its own style guide, which is marked for clear readability and understanding. There are always good patterns and bad patterns in any language. You should chose patterns with a bit of safety in it. Using descriptive variables will make it more readable.   

```python
# OK pattern
f = open("helloWorld",r); 
# do something with file 
f.close()

# A little bit safe pattern
with open(file) as f:
	# do something with file
```	  

## Follow these Design Principles ##
- **Do similar things in similar ways** 
	- Your code patterns should be consistent through out your code. 
- **Keep it simple and stupid (KISS)**
	- Modularize your code into short pieces of function that achieve one purpose
- **Do not repeat yourself(Dry)**
	- Refactor your code to reduce size, and do not duplicate the code 	 
- **Principle of Least Astonishment**
	- Do not go for needless complexity in your code, use simple interfaces 
- **Articulate your thoughts with the help of**
	- pen and paper, to mark down your thought process. Could be a pseudo code or diagram.  
	- Ask colleagues and friends for reviews.
	- Some times it will just come to you
- **Steal from others**
	- Check out the good codebases like kubernetes or servo and adopt its style into yours.  	 	 

## Test and Tooling ##
- Use linter for checking goodness of your code. (and may be other tools too)
- Unit tests, and complete tests for code in your continuous integration systems.
- More checks to qualify freshness and correctness of your code.
- Do more and more error handling 

These are just principles, but important thing is that writing good code should be a main goal of your software engineering career. Being in startups, it is sometimes hard to get this kind of code quality, as we are free to do anything. But you have to learn.  

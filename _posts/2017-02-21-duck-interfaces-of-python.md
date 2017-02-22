---
layout: post
title: Duck interfaces of Python
type: blog
tags: [python, design patterns]
categories: [programming]
---

Let's look at this piece of code: 

<script src="https://gist.github.com/rarchk/83e16fb6dee003353e499320d3383888.js"></script>
We all know that python has lists, tuples, dictionaries etc. where you can do array like operations like checking out length, setting or getting indexes, or iterating them in a loop.  With above code, we have basically made our hello function behave like one of those collections. 

```python
>>> a = hello(); 
>>> a # tells us about representation form of this object 
>>> len(a); 
>>> print(a);
>>> a[3]; 
>>> for i in a:
...	print i; 

```					 

This all happened because python follows duck typing approach, where you do not check on type but fuctionality of an object at run time. In words of [Alex Martelli](https://en.wikipedia.org/wiki/Alex_Martelli)

> Don't check whether it IS-a duck: check whether it QUACKS-like-a duck, WALKS-like-a duck, etc.  

In normal typing method, an object suitability is determined by an object's type only whereas in duck typing, suitability is determined by presence of these methods/properties.

Have you ever wondered, when you run a python program, and it runs fine unless it goes to a certain faulty function in its execution work flow. That happens because python only interprets a part of type's structure that is accessed during runtime. 
  
It is a powerful feature of python, and lets you help writing a more readable python code. Some people may call it magical methods and some may call it Dynamic binding too.
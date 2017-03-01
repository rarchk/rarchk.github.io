---
layout: post
title: Small Linux Experiments
type: os
tags: [linux,experiments]
categories: [systems]
---

## Deadlock visualisation using strace 
```
open two bash terminals 
run strace on one bash and on another bash run strace for first
both will be showing waitpid
```

## Experiments with fork bomb
```c
int main(){
while(1)fork();
return(0);
 }
```		 
- What are different ways in which you can limit the fork bomb? 
- How pid's are allocated during fork bomb ? 
- Check out the strace of a fork bomb program ?

## Program and memory access patterns
**Which will work, which will not and why?**

```c
int main()
{
   char *p;
   p="abc";
}

int main()
{
	char *p="a";
	strcat(p,"bc");
}

int main()
{
	char *p=malloc(sizeof(char)*10);
	strcpy(p,"hello!")
}
```


---
layout: post
title: Understanding a little bit of Technical Debt
type: blog
tags: [software engineering,thoughts]
categories: [Software Process]
---
Universe is expanding, and so is your software. But unlike Universe which is gunning for more entropy/disorder, in software, we always wish to have an order of things. Alas, in reality, our decisions whether it may seem reasonable at the time comes up with their little loads, and little by little, this load adds up as debt. Official jargon for this phenomena is referred as **technical debt**.


> **technical debt** is a metaphor referring to the eventual consequences of poor system design, software architecture or software development within a codebase. The debt can be thought of as work that needs to be done before a particular job can be considered complete or proper. If the debt is not repaid, then it will keep on accumulating interest, making it hard to implement changes later on. Unaddressable technical debt increases software entropy.

 <p align="right"><b>Source:</b><a href="http://www.wikiwand.com/en/Technical_debt">Wikipedia</a> </p> 
 From what I understand, while we design for systems, we should always keep track of two things

 + **Pros/Cons on choice of technology, while you are building for it.**

    While everybody test this measure based on their needs, like performance, robustness, speed for adaptation, expertise etc. Unless, you consider the
    lagging points of this choice, you will eventually will be in debt.  
    For example, Facebook started with PHP as a base, because it had back-end/front-end features, there was a lot of documentation available, and Mark Zuckerberg and his initial team knew PHP. Since PHP is a scripting language, they would have eventually hit the performance wall. So a debt was created as a result of their choice. But they came around, and built [HipHop](http://hhvm.com/) compiler, which changed PHP from interactive language to compiled language. It definitely reduced their debt, if not canceled it. 

 + **A Foresight for Product**
 
   As we keep on progressing, adding new features to our product, discovering new values and streams for our product, complexity of both our code-base as well as impact of our choice will increase. Increase in code-base will hinder us to switch to new/better language. And, our choice, which seemed perfect for initial use-case, might not be efficient for future use-cases. You either will have to go with modular design, or break the monolithic nature of your application by decomposing into services with sensible choices. But this is is no easy task, and might require major reorganization of your applications. So you should have a keen foresight in regard to your product, and the fact that foresight is no stagnant notion. It may keep updating itself, so a retrospection is needed.  
   One Example that comes in mind is, Microsoft's recent [organizational shift](http://www.wsj.com/articles/microsoft-ceo-nadella-hints-at-organizational-changes-1405003356), follows on same principle, though it is just analogy. 


I hereby, end my discussion on nature of technical debt. I myself, keep thinking about these issues, but you always don't have liberty to think, sometimes you have to commit, and then worry later. Here is a great article on [Technical Debt](https://medium.com/@joaomilho/festina-lente-e29070811b84) by Maiz Lulkin.

---
layout: post
title: My First Site Performance Report
type: blog
tags: [optimization,web systems]
categories: [systems]
---
Within community, [Etsy](https://etsy.com)'s [Code as a craft](https://codeascraft.com) is a famous blog, where they write about their engineering adventures and misadventures. Within this, they write about a series of posts marked as **Site Performance Report**. It is a quarterly post which illustrates how the site was improved in performance. Every performance gain is explained by their engineers. If you have time, you should check it out.

Inspired from their reports, I decided to generate report for my own personal web site. To get started, it would be better if I give some context in which I work 

- I use github pages, so github handles content distribution and serving part. For this part, I do not or I cannot optimize.
- I took my website template from existing jekyll templates, and decided to self customize it a little bit. 
- I started writing blogs which inspired me.   


## **DNS Lookups** ##
It is basically time, which computer needs, in order to figure out the ip address of a domain.
	
+ My site sends request to the *github.io* and multiple third party resources like, *font-awesome*, *disqus-comments*, *google-analytics*,and  *mathjax*.
+ If there are lot of dns lookups on your site, then may be it is time to check on how you consume these resources or make these as asynchronous requests in your path.  

## **Content Downloads** ##
Once DNS has been looked up, there is need for understanding what kind of content, is your site requesting to the server, and also deciding a priority on those resources is crucial. These resources can be html, javascript and other images. 

For eg. here was my old masthead, that I designed in the beginning of my web design process, but eventually saw that it was one of the thing that was making my every page load slower, for two reasons 

- I did not cache this resource 
- Its size is 24Kb 
![Old masthead](https://rarchk.github.io/public/logo.png)

So after replacing it with a text element, my website performance jumped up. So it is important to recognize the importance of each content that your website is serving. 

## **Blocking CSS Scripts** ##
To talk about this optimization, let's understand how our websites are typically rendered. 

- First our browsers get an html file which consists of all resource elements. 
- Browser *constructs a DOM tree*, which is syntactic structure of your web page.  
- Now browser needs to *fill each element with its colors, size etc.* We can write these attributes in tag itself, but we generally define these things in css file. 
- After browser is done with applying attributes, it displays the web page. 

So one bottleneck, that can come here is, **if your css file is not available, then browser renderer will not be able to display the html.** So a bare minimum css should be there for your site, and other css you can load asynchronously. 

## Minifying, Compressing and Browser Caching ##
- We do not need a  well indented javascript or css, in production . So one trade-off can be, **minifying these scripts for the gain of some bandwidth.** 
	+ There are online tools that minify these scripts or *Clojure compiler* that can help you with that. 
- All content greater than minimum threshold size, should be enabled with *gzip*. HTML5 supports gzip compression and decompression for resource elements. This greatly saves bandwidth and decrease page load times.  
- For images, it is better to **encode them with mozjpeg**, which reduces the size of an image by cluttering out *all meta data and compressing it to the web standards.*
- **Browser Caching** should only be done for elements, when one particular element is gonna used rigorously. Every resource should not be cached, but if done, browser caching can greatly **decrease the ammortized page load times of the site.** 

## Results ##
I do not have graphs, but this image as final showcase of my work done on my site. Still there are a lot of optimizations left for me to do, but all in time.
![My site performance](https://rarchk.github.io/public/images/SiteAfterUpdate.png) 	  

## References ##
I used following tools to evaluate my website performance

- Google and Firefox Web Inspector tools
	+ They let you see the kind of requests that your website is making
	+ They let you live update color and other settings in your website design very easily
	+ You have a detailed grasp on time line of web page's first,second or third load.
- I gathered ranking score of my website performance from 
	+ [Google Page Speed Insights](https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Frarchk.github.io) 
	+ [Web Page Test](http://www.webpagetest.org/)
- I checked out some performance enhancing blogs 
	- [Ten Things I learned making the fastest site in the world](https://hackernoon.com/10-things-i-learned-making-the-fastest-site-in-the-world-18a0e1cdf4a7#.lj3qakwsc)
	- [Web Performance](http://www.stevesouders.com/) by *Steve Sounders*
	- [High Performance Browser Networking](http://hpbn.co/) by *Ilya Grigorik* 	 

  

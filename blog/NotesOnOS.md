---
layout: page
title: Notes On Operating Systems
banner_image: operatingsystems.jpg
banner_image_alt: Operating Systems
---


I love operating systems and I want to write and share my understanding of it. In process, I may find more amazing insights on how it works, and what are different design consideration that were taken in order to design such a marvelous piece of software. I've been inspired to write from the work of [Julia Evans](https://twitter.com/b0rk), [Remzi](http://pages.cs.wisc.edu/~remzi/OSTEP/) and my previous work as [OS TA](https://researchweb.iiit.ac.in/~ronak.kogta/ICS231) 


## Table of Contents ##


## Understanding anatomy of a program ##
1. How a program actually works? 
2. Internals of a processes


## Diving into Memory sub-system ##
1. How a process manages its memory
2. How an operating system manages its memory

## Fantastic Concurrency and how to tame them ##
1. [Concurrency Demons and where to find them](https://rarchk.github.io/systems/2017/02/08/concurrency-demons-and-where-to-find-them/)
2. [Concurrency Demons and how to tame them]()  

## File systems ## 
1. Introduction
2. File system Internals  

### Appendix ###
1. State machine and multiple abstractions
2. [A brief tutorial on system calls](https://rarchk.github.io/systems/2017/01/26/a-brief-tutorial-on-system-calls/)
3. [Understanding /proc file system](https://rarchk.github.io/systems/2016/07/07/internals-of-proc-in-linux/)
3. [A brief tutorial on linux memory](https://rarchk.github.io/systems/2017/01/26/a-brief-tutorial-on-linux-memories/)
4. Effective guide to linux IPC mechanisms
5. What is virtualization
6. What are containers


{% if site.disqus_short_name %}
<div class="comments">
  <h2>Comments</h2>
  <div id="disqus_thread"></div>
  <script>
var disqus_config = function () {
  this.page.url = '{{ site.url }}{{ page.url }}'; // Replace PAGE_URL with your page's canonical URL variable
  this.page.identifier = '{{ page.id }}'; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
(function() {
  var d = document, s = d.createElement('script');
  s.src = '//{{ site.disqus_short_name }}.disqus.com/embed.js';
  s.setAttribute('data-timestamp', +new Date());
  (d.head || d.body).appendChild(s);
})();
  </script>
  <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
</div>
{% endif %}
    
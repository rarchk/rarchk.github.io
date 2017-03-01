---
layout: post
title: Designing a CDN service
type: blog
tags: [design,optimization]
categories: [systems]
---

## What is CDN ? 
CDN (Content Delivery Network) are network of servers distributed geographically, and their main purpose is to serve static content to the end-users with minimal latency. This optimization makes sense because in my post about [latency numbers](https://rarchk.github.io/systems/2017/01/26/latency-numbers-that-every-software-programmer-should-know/), network latency of a continental round trip is about 150 ms. So for a typical bandwidth of 1 Mbps connection, and for downloading data of 5.6 MB, time required to fetch that data we 

$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$

Basic components of CDN 

- Content Caching Server (Warm cache vs Cold Cache)
- Request Redirection to closest ones 
- Caches employ multi-level lookup tables that use optimized algorithms to find the correct content in the shortest amount of time.

Optimization 
=== 
- Reverse proxying 
- Instant edge based purging (you should be able to update invalid cache data quickly)
- Can we cache dynamic stuff. 
- 

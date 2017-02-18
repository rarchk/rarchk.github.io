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
- Instant edge based purging 
Traditionally, when using a CDN, it is the customer’s job to upload content directly to the cache servers. Instead of requiring one initial cache fill, Fastly fetches – and then stores – the content from the customer’s origin server as it’s requested. This method, called “reverse proxying”, eliminates the need to front-load the caches.

When content changes, instead of uploading a new copy of the resource, Fastly’s customers send us a short message instructing our cache servers to invalidate that content. Later, when the invalid content is requested, we fetch and replace the content via the origin. This process, called “instant purging”, allows customers to perform updates in approximately 200ms. With legacy CDNs the upload process can take anywhere from 15 minutes to an hour.

Instant purging also sets Fastly apart from its competitors in a significant way: we make it possible to serve dynamic content. Because any HTTP request can be cached, we simply fetch the dynamic page from origin and our customers issue a purge request when the underlying data-model changes. In some cases it can be as simple as adding a hook in the model-level of an application.

The skinny: Fastly redefines the legacy CDN model through advanced features such as reverse proxying and instant purging.     

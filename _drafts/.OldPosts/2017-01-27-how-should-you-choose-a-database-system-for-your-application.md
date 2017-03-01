---
layout: post
title: How should you choose a database system for your application
type: blog
tags: [design,databases]
categories: [systems]
---

Now a days, we often keep hearing the different database systems like *mongoDB, POSTGR SQL, Dynamod DB, Cassandra, neo4j etc.*  

> **Impedance mismatch**: We handle most of data in OO way, whereas SQL is a relational tables. So an awkward translation of objects to relations has to be done in application code. This disconnect is called impedance mismatch.  
> **Polyglot persistence**: Existence of relational databases  alongside a broad variety of non-relational data stores.
> Normalization, Denormalization, Derived Data and Caching in DB (keeping denormalized data consistent is the responsibility of application.) 

- One data model is build upon another data model, so it is important to know how it is represented in terms of the next-lower layer. 

- One important characteristic of any data model is to have clarity of concepts it can do, and does not expose lower level details to this layer. 

- Every data model embodies assumptions about how it is going to be used. 




## Relational vs Network vs Hierarchical approaches to store data

- On various front, comparison between relational database and document data bases 
	- their handling of  many-to-one and many-to-many relationships. 
		+ in both cases, the related item is referenced by a unique identifier, which is called a foreign key in the relational model, and a document reference in the document model. That identifier is resolved at read time, by using a join or follow-up queries.

	- storage locality
		+ Google’s Spanner is a relational database  which offers locality properties in a relational data model, by allowing the schema to declare that a table’s rows should be interleaved (nested) within a parent table 
		+ Oracle's multi-table index cluster tables 
		+ The column-family concept in the Bigtable data model 

	- impedance threshold of your application might give you hint on which side to pick.  
	- on-read schema vs on-write-schema (just like interpeter vs compiler) and their enforcement 
		+ there is no right or wrong answer in thinking about this aspect of your data, you have to pick your tradeoffs, and try to hide latencies wherever you can with other solutions
		+ heterogeneous vs homogeneous data items 
		+ updating schema costs 
		+ 

	- data access patterns, if you need data to do any query then relational might be a good fit.  
	- fault tolerance properties 
	- handling of concurrency 
- Query Language 
	- Imperative : where you define the order and the way you want your data to be in. C, Javascript etc. 
	- Declarative : where you define pattern of data that you want and it is parallelizable. SQL, CSS, XSL

- Graph Database 
	+ social graphs, web graph, roads and rail and flights
	+ good for many-to-many relationships between homogeneous data as well as heterogeneous data 
	+ property graph model (neo4j,infinitegraph) 
	+ triple store model  (datomic,allegrograph)
	+ Declarative language for graph (datalog,sparql,cypher)
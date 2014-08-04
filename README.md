# SQL, the Sequel
##### More SQL in the Database, and SQL in Data Science Contexts (i.e. SQL on DataFrames)

This repository contains materials for [my talk at the Data Wranglers DC meetup on August 6, 2014](http://www.meetup.com/Data-Wranglers-DC/events/177269432/), which is a follow-on to [my talk at the Data Wranglers DC meetup on June 4, 2014](http://www.meetup.com/Data-Wranglers-DC/events/171768162/).  Materials for the prior talk are in the GitHub Repo [nihonjinrxs/dwdc-june2014](http://www.github.com/nihonjinrxs/dwdc-june2014).

### Contents
The talk consists of two major directions:
- Using more advanced SQL techniques in a database system (examples in PostgreSQL) to script auto-updating computations
- Using SQL on data frames in R and in Python (also maybe Julia?)

Folders are as follows (content coming soon... this is a work in progress!)
- A slide deck (`./slides`) in Apple Keynote, [PDF](http://nihonjinrxs.github.io/dwdc-august2014/DWDC-August2014-RyanHarvey.pdf) and [HTML](http://nihonjinrxs.github.io/dwdc-august2014) formats
- A set of SQL scripts (`./sql`) that create the local PostgreSQL database objects demonstrating creation and use of views, custom functions and indexes for use in data analysis
- An RMarkdown document (`./R`), [published on RPubs](http://rpubs.com/ryanbharvey/dwdc-august2014), that demonstrates using `sqldf` in R to perform SQL queries on data frames as if they are tables
- An IPython notebook (./python) that demonstrates using `sqldf` from the `pandasql` package to perform SQL queries on Pandas DataFrame objects as if they are tables
- An IJulia notebook document (`./julia`) that demonstrates using `sqldf` from the `SQLite.jl` package in Julia to perform SQL queries on data frames as if they are tables (in progress, and not working yet)

### Where do I start?
I recommend that anyone wishing to understand what I've done should start with [the prior talk materials](http://www.github.com/nihonjinrxs/dwdc-june2014), then tackle these pieces in order, starting with the slide deck.

### Future Work
Given time, I hope to get `sqldf` working in Julia as well - being a young language, it's a little finicky at the moment. Also, a few examples of SQL views with INSERT and UPDATE rules and a SQL trigger or two would be a nice addition.

### Disclaimer
This work and the opinions expressed here are my own, and do not purport to represent the views of my current or former employers.

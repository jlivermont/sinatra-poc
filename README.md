# sinatra-poc

## Introduction

This is a playground/proof of concept to get a feel for how lightweight apps and services might be built upon Sinatra.

This PoC is the back-end of a simple todo list app.  The backend service allows for CRUD operations on todo lists and entries on those lists.

## Installation

### DB

The default local database engine is sqlite.  DB configuration can be found in `config/databases.yml`.  The ORM is [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord).  Rake is configured and normal rake tasks are supported.  For example, to create a new table for the app, run:

```bash
$ bundle exec rake db:create
```

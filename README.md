# sinatra-poc

## Introduction

This is a playground/proof of concept to get a feel for how lightweight apps and services might be built upon Sinatra.

This PoC is the back-end of a simple todo list app.  The backend service allows for CRUD operations on todo lists and entries on those lists.

## Installation

### DB

The default local database engine is sqlite.  DB configuration can be found in `config/databases.yml`.  The ORM is [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord).  Rake is configured and normal rake tasks are supported.

To initialize a new sqlite DB and apply migrations, run:

```bash
$ bundle exec rake db:create db:migrate
```

To re-initialize the DB and re-apply all migrations:

```bash
$ RACK_ENV=development bundle exec rake db:drop db:create db:migrate
```

### Testing

To install dependencies for testing, run:

```bash
$ bundle install --with=test
```

To run spec tests, run:

```bash
$ bundle exec rspec spec --color
```

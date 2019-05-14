# sinatra-poc

## Introduction

This is a playground/proof of concept to get a feel for how lightweight apps and services might be built upon Sinatra.

This PoC is the back-end of a simple todo list service.  The backend service allows for CRUD operations on todo lists and entries on those lists.

## Running

To run the service:

```bash
$ RACK_ENV=development ruby service.rb
```

`RACK_ENV` can also be set to `test` or `production`.

## Routes

### GET /api/v1/todos - Get all todos

```bash
$ curl -v -X GET  http://{host}/api/v1/todos
```

### POST /api/v1/todos - Create a new todo

```bash
$ curl -v -X POST -H 'Content-Type: application/json' -d '{"description":"sample todo list"}' http://{host}/api/v1/todos
```

### PATCH /api/v1/todos/:id - Update an existing todo

```bash
$ curl -v -X PATCH -H 'Content-Type: application/json' -d '{"description":"updated description"}' http://{host}/api/v1/todos/{id}
```

## Installation

### Dependencies

To install project dependencies, run:

```bash
$ bundle install
```

### DB

The default local database engine is postgresql, but sqlite is supported as well.  DB configuration can be found in `app/config/databases.yml`.  The ORM is [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord).  Rake is configured and normal rake tasks are supported.

To setup Postgres with a database named `postgres` and a user named `postgres`, using Homebrew for Mac:

```bash
$ brew install postgres
$ brew services start postgresql
$ initdb -U postgres -W -E utf8 /usr/local/var/postgres
$ createuser -s -r -W postgres
```

To initialize a new Postgres DB and apply migrations, run:

```bash
$ RACK_ENV=development bundle exec rake db:create db:migrate
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

To run tests and have description of each test executed, run:

```bash
$ bundle exec rspec spec -f d --color
```

To run static code analysis, run:

```bash
$ rubocop
```

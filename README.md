# Migrations

- [Overview](#overview)
- [Development](#development)
- [Env](#env)

## Overview
Migrations is a project that contains the current database schema for the Galaxy Empire game. It helps set up the database and updates it whenever the schema changes.

## Development
To start working with migrations, run cmd/main.go with the environment variables listed below.

## Env
An example of environment variables required by an API:
```
PG_HOST=localhost
PG_PORT=8090
PG_USER=bormon
PG_PASSWORD=postgres_password
PG_DB_NAME=ge

MIGRATIONS_DIR=$(pwd)/migration/migrations
```
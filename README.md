# Ruby Project

This project uses ActiveRecord, Sidekiq, and other gems for managing jobs, models, and migrations.

## Prerequisites

- Ruby 3.x
- Bundler
- PostgreSQL
- Redis

Install dependencies:

```sh
bundle install
```

## Configuration

1. Create a `.env` file at the root (already present in this repo as an example).
2. Configure your database in [`config/database.yml`](config/database.yml).

## Launch the console

```sh
bin/console
```

## Create a migration

Use the custom Rake task:

```sh
bundle exec rake generate:migration[MigrationName]
```

A file will be created in `db/migrate/`. Edit it as needed.

To apply migrations:

```sh
bundle exec rake db:migrate
```

## Create a model

Add a Ruby file in [`app/models/`](app/models/):

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
end
```

## Start Sidekiq

```sh
bin/sidekiq
```

## Start the Sidekiq Web UI

```sh
bin/sidekiq_ui
```

The interface will be available at [http://localhost:9292](http://localhost:9292).

## Logger

Use [`ApplicationLogger`](lib/application_logger.rb) for logging:

```ruby
ApplicationLogger.info("Info message")
ApplicationLogger.error("Error message")
```

---

For any questions, check the project files or open an issue.

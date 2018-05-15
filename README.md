AppConfig
---------
Keep all the configuration variables under a single namespace.

## Installation

```rb
# Gemfile
gem 'appconfig', github: 'honeypotio/appconfig-rb', require: false
```

`require 'appconfig'` possibly before than any other file (which in Rails is after `require 'rails/all'`).

If you use `Dotenv`, initialize it before this gem though.

## Setup

Create a `config` folder and store two new files called `secrets.yml` and `config.yml` (in a Rails app you only need the last one).

The `config.yml` could initially look like this:

```yml
default: &defaults
  hello_email: <%= ENV.fetch('HELLO_EMAIL', 'hello@honeypot.io') %>

  title: 'Honeypot - The Developer-Focused Job Platform'
  description: 'Honeypot is a Developer-Focused Job Platform. Companies apply to you with salary and tech stack upfront.'
  protocol: 'https'

development:
  <<: *defaults
  protocol: 'http'
```

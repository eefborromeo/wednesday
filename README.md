# **[Wednesday](https://wednesday-trading.herokuapp.com/)**

[![wednesday-app.png](https://i.postimg.cc/rwLC7J29/wednesday-app.png)](https://postimg.cc/HVByybxJ)

A stock trading app simulation for asset trading primarily featuring IEX Finance market information. Users can use this app to search for valid asset symbols, and add them to their portfolio so that they can begin making transactions with a specific asset. This app features **[IEX Client](https://github.com/dblock/iex-ruby-client)** to retrieve all asset related information, **[Devise](https://github.com/heartcombo/devise)** for account authorization and access, **[Chartkick](https://github.com/ankane/chartkick)** in combination with **[Groupdate](https://github.com/ankane/groupdate)** to display visual representation of data, **[Rspec](https://github.com/rspec/rspec-rails)**, **[Faker](https://github.com/faker-ruby/faker)** and **[Database Rewinder](https://github.com/amatsuda/database_rewinder)** for pristine test suite testing, and **[Tailwind CSS](https://github.com/rails/tailwindcss-rails)** for front-end related styling and layout. 

##### This project is deployed on Heroku and can be accessed by clicking on the title above.
-----------

## Ruby Version

Ruby 3.1.2

## System Dependencies

* Rails 6.1.6
* NodeJS 16.3.0
* Yarn 1.22.18
* PostgreSQL 14.2

## Featured Gems
* gem 'iex-ruby-client'
* gem 'devise'
* gem 'ransack'
* gem 'chartkick'
* gem 'groupdate'
* gem 'tailwind-css'
* gem 'rspec-rails'
* gem 'faker'
* gem 'database-rewinder'

## Configuration

```
bundle install
yarn install --check-files
bundle binstubs rspec-core (creates executable for rspec)
```

## Database Initialization

```
rails db:create
  or
rails db:setup (to initiate seeds on the database)

rails db:migrate
```

## How to run the Test Suite

```
bin/rspec (courtesy of bundle binstubs rspec-core)
```

## Deployment Instructions

```
heroku login
git push heroku <branch name>
heroku run rails db:migrate
heroku run rails db:seed
```
-----------

Fair Use

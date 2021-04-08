# Jungle Project

Jungle is web application built on Ruby on Rails.

<br>

## Getting Started

<br>

- Install all gems.

```
bundle install
```

- Create `config/database.yml` by copying `config/database.example.yml`
- Create `config/secrets.yml` by copying `config/secrets.example.yml`
- Create, load and seed the db.

```
bin/rake db:reset
```

- Create `.env` file based on `.env.example`
- Sign up for a Stripe account
- Put Stripe (test) keys into appropriate .env vars
- Start the server

```
bin/rails s -b 0.0.0.0
```

- Visit the following URL to start navigating the web application _after_ running the server

```
http://localhost:3000/
```

## Final Product

!["Screenshot of Login page"](https://github.com/Just-Hosam/jungle/blob/master/docs/Screen%20Shot%202021-04-07%20at%2010.09.41%20PM.png)

## Known Issues/Bugs

- You can add a sold out item to the cart

## Future Features

- Implement email receipts

## Gems

- Rails
- pg
- sass-rails
- uglifier
- jquery-rails
- turbolinks
- jbuilder
- sdoc
- puma
- newrelic_rpm
- rails_12factor

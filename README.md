# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Implemented Features

* Sold Out Badge - When product is sold out, a badge will be displayed 
* Admin Categories - Admin users can create new categories and add new products to categories
* User Authentication (with uniqueness validation) - As a visitor you can register as a user and login/logout, has_secure_password and bcyrpt gem are utilized
* Order Details Page - Order page that contains all order items for user with their email and total amount due

## Bug Fixes
* Missing Admin Security - Added HTTP auth login/password to access admin functionality
* Checking Out with Empty Cart - Show error when cart is empty to tell user to add items and go back to the home page

## Testing
* RSPEC, Capybara, Poltergeist(Phantomjs), Database Cleaner

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Screenshots of App in Action

![Screenshot of Cart](https://github.com/elim04/jungle-rails/blob/master/docs/cart.png)
![Screenshot of Admin Products Page](https://github.com/elim04/jungle-rails/blob/master/docs/admin_product_page.png)
![Screenshot of Home Page](https://github.com/elim04/jungle-rails/blob/master/docs/home_page.png)


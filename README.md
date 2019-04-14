<a href="https://codeclimate.com/github/Estevenson1994/Clothes-Store/maintainability"><img src="https://api.codeclimate.com/v1/badges/0b3432a46598e00c3572/maintainability" /></a>  <a href="https://codeclimate.com/github/Estevenson1994/Clothes-Store/test_coverage"><img src="https://api.codeclimate.com/v1/badges/0b3432a46598e00c3572/test_coverage" /></a>  [![Build Status](https://travis-ci.org/Estevenson1994/Clothes-Store.svg?branch=master)](https://travis-ci.org/Estevenson1994/Clothes-Store)

# Clothes Store

This is a responsive website designed to replicate a clothing retailers website. This has been completed with 100% test coverage and codeclimate maintainability grade A.

## Technologies used:

- Ruby for development
- Sinatra DSL to build API endpoints
- Bootstrap framework to include responsive columns on the UI
- RSpec for unit tests
- Capybara for feature tests
- Rubocop for linting
- Codeclimate to test code complexity and maintainability
- SimpleCov for test coverage
- Rufo for Ruby formatting guidelines

## How to use

I have deployed this webpage [here](https://erin-stevenson-clothes-store.herokuapp.com/) for easy access.

To run this program locally:
- clone and download this repository `git@github.com:Estevenson1994/Clothes-Store.git`
- go into the project directory `cd Clothes-Store`
- run `bundle install` to install dependencies
- run `rackup` to start the server
- go to `http://localhost:9292` to view the UI

To run tests:
- run `rspec` to run all unit and feature tests

To run linter:
- run `rubocop`

## Approach

To see how the program works from a users perspective, please see [here](https://github.com/Estevenson1994/Clothes-Store/wiki/How-the-program-works-from-a-users-perspective)

This program was build around the following user stories:

```
As a user,
So I can decide what I want to buy, 
I want to see a list of items available

As a user,
So I can buy an item,
I want to be able to add the item to my shopping cart

As a user, 
If I change my mind, 
I want to be able to remove an item from my shopping cart

As a user,
So I can see how much I am going to spend, 
I want to see the total cost of all items in my shopping cart

As a user, 
So I can get a discount on my purchases,
I want to be able to add vouchers at checkout

As a user, 
So I can see how much I am going spend with vouchers,
I want to see the total item cost including discounts at checkout

As a user, 
So that I know if my voucher is invalid, 
I want to be alerted when applying the voucher that it is invalid

As a user,
So I know if an item is available,
I want to see the total stock of each item

As a user, 
So I can't add an out of stock item to my basket, 
I want to be alerted when trying to add an out of stock item to my basket

Additional user story:

As a user, 
So I change my mind about using a voucher
I want to be able to remove the voucher from checkout

```







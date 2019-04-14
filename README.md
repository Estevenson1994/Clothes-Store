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

## User stories

To see how the program works from a users perspective, please see [here](https://github.com/Estevenson1994/Clothes-Store/wiki/How-the-program-works)

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

## Approach

The technology used for this application includes Ruby and Sinatra, as I feel these were the best options to demonstrate the practises I have learnt during my time at Makers. I chose not to use the Rails framework for the puropse of this excercise, to demonstrate more of my programming ability. Meaning, each section of the program I have build myself, whereas if I had used Rails, as useful as it is, alot of the functionality is provided.

I took an iterative approach to building this application. This went as follows:
1. Plan out minimum viable product for the iteration. The first iteration included the first four user stories
2. Diagram out how the program should work.
3. Write unit tests to get the backend functionality to work
4. Pass unit tests
5. Refactor if necessary
5. Write feature tests from the users perspective
6. Implement api end points and UI design to pass feature tests
8. Refactor if necessaru
7. Repeat for each iteration until all user stories were complete


### Architecture

This program is build using the Model-View-Controller architectual pattern:

![screenshot](https://i.imgur.com/jUiUD59.png)

### Data Storage

This application uses data stored as a hash constant. This can be found in the folder `/data/*rb`
This was chosen to Mock out the database interaction and to replicate how the data would be return if a postgres database was used. Therefore, with further development, a database can implemented without having to change the code.

This folder also contains the file `data_setup.rb` which tells to program which data use, depending on which environment it is running, e.g. test or production. Therefore the production data is not altered when running tests.

The test data is reset before each test in a 'before' block found in the [spec_helper](https://github.com/Estevenson1994/Clothes-Store/blob/master/spec/spec_helper.rb) file so that each test starts with a fresh data set. This method was writen [here](https://github.com/Estevenson1994/Clothes-Store/blob/master/spec/reset_test_data.rb). This is to replicate a database tear down that would be performed if a database was used.

![screenshot](https://i.imgur.com/yf69740.png)














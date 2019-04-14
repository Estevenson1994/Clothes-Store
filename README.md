<a href="https://codeclimate.com/github/Estevenson1994/Clothes-Store/maintainability"><img src="https://api.codeclimate.com/v1/badges/0b3432a46598e00c3572/maintainability" /></a>  <a href="https://codeclimate.com/github/Estevenson1994/Clothes-Store/test_coverage"><img src="https://api.codeclimate.com/v1/badges/0b3432a46598e00c3572/test_coverage" /></a>  [![Build Status](https://travis-ci.org/Estevenson1994/Clothes-Store.svg?branch=master)](https://travis-ci.org/Estevenson1994/Clothes-Store)

[Intro](#clothes-store) | [Tech](#technologies-used) | [Instructions](#how-to-use) | [User Stories](#user-stories) | [Approach](#approach) | [Challenges](#challenges) | [Assumptions](#assumptions)

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

The technology used for this application includes Ruby and Sinatra, as I feel these were the best options to demonstrate the practices I have learnt during my time at Makers. I chose not to use the Rails framework for the purpose of this excercise, to demonstrate more of my programming ability. Meaning, each section of the program I have build myself, whereas if I had used Rails, as useful as it is, alot of the functionality is provided.

I took an iterative approach to building this application. This went as follows:
1. Plan out minimum viable product for the iteration. The first iteration included the first four user stories
2. Diagram out how the program should work
3. Write unit tests to get the backend functionality to work
4. Pass unit tests
5. Refactor if necessary
5. Write feature tests from the users perspective
6. Implement api end points and UI design to pass feature tests
8. Refactor if necessary
7. Repeat for each iteration until all user stories were complete


### Architecture

This program is build using the Model-View-Controller architectual pattern:

![screenshot](https://i.imgur.com/jUiUD59.png)

### Data Storage

This application uses data stored as an array of hashes, stored in a constant. This can be found in the folder [data](https://github.com/Estevenson1994/Clothes-Store/tree/master/data).
This was chosen to Mock out the database interaction and to replicate how the data would be return if a postgres database was used. Therefore, with further development, a database can implemented without having to change the code.

This folder also contains the file [data_setup.rb](https://github.com/Estevenson1994/Clothes-Store/blob/master/data/data_setup.rb) which tells the program which data to use, depending on which environment it is running in i.e. test or production. Therefore the production data is not altered when running tests.

The test data is reset before each test in a 'before' block found in the [spec_helper](https://github.com/Estevenson1994/Clothes-Store/blob/master/spec/spec_helper.rb). Therefore each test starts with a fresh data set. This method was writen [here](https://github.com/Estevenson1994/Clothes-Store/blob/master/spec/reset_test_data.rb). This is to replicate a database tear down that would be performed if a database was used.

![screenshot](https://i.imgur.com/yf69740.png)

### Class Design

### Product 

Found in [lib/product.rb](https://github.com/Estevenson1994/Clothes-Store/blob/master/lib/product.rb)

This class was designed as an [ActiveType](https://github.com/makandra/active_type) class. This object replicates an ActiveRecord object, but is not backed by a database. This was chosen so that ActiveRecord could easily be implemented with further development.

#### The methods written on this class were designed to replicate ActiveRecord methods:

#all - method that returns all product data

#find(id) - method to find a particular product by its id.

#### The other methods are specific to this usecase:

#reduce_stock(id) - reduces the stock of a particualar item - to be called when adding an item to the cart

#increase stock(id) - inceases the stock of a particular item - to be called when removing an item from the cart

#create_product(item) - creates a Product object

#find_item_index(id) - finds the index of a item stored by its id (data is stored in an array)

#item_is_out_of_stock(id) - returns true if item is out of stock

### Cart

Found in [lib/cart.rb](https://github.com/Estevenson1994/Clothes-Store/blob/master/lib/cart.rb)

This is a regular ruby class, instantiated on the home page. I chose to instantiate this here rather than when an item is added to the basket as to prevent a new cart being created everytime an item is added to it.

#### This class has the following attributes:

+ basket - array to store items to be purchased (stores cart items not products - see below)
+ total_cost - keeps track of the total cost of items in the basket
+ product - has access to the product class to recieve item details - this is so the details can be given to the CartItem which is stored in the basket.

#### The main two methods found on this class are:

#add_item(item) -  either increase the quantity of the CartItem in the basket, or add a new cart object to the basket and update the total cost

#remove_item(item) - either decrease the quantity of the CartItem in the basket, or remove if from the basket and update the total_cost

### CartItem

Found in [lib/cart_item.rb](https://github.com/Estevenson1994/Clothes-Store/blob/master/lib/cart_item.rb)

This object has been written as a Struct. This was chosen because the cart item is only a tempory object used to keep track of what the user is intending to buy. Therefore, I decided a class was not needed, and this approach would be more efficient. 
A struct also takes up less memory than a regular object, therefore more of these can be stored in the cookie/session, enabling the user to add more items to their basket. 

#### This class has the following attributes:

+ id - to keep a relationship between CartItems and Products
+ category - to be used to check if the right item is in the basket when a voucher is applied at checkout
+ price - to keep track of the price of the items in the basket
+ quantity - to keep track of the number of times the item is added to the basket.

#### Methods:

#increase_quantity - to be called when adding a duplicate item to the basket. This is done instead on adding a whole new object to the basket to save memory on the cookie.

#decrease_quatity - to be called when removing a duplicate item from the basket.

#more_than_one? - returns true if a cart item has been added to the basket more than once, and therefore it has a quantity greater than 0.

### Voucher

Found in [lib/voucher.rb](https://github.com/Estevenson1994/Clothes-Store/blob/master/lib/voucher.rb)

This class was also designed as an ActiveType object so that it could be easily converted into an ActiveRecord object. This design choice was made, so that more vouchers could easily be added to the data.

#### This class has the following attributes:

+ id - each voucher has a unique id related to the amount of money it will take of the total price
+ amount - to store how much money it will discount
+ min_spend - stores whether the voucher requires a minimum spend
+ required_item - stores whether the voucher requires a particular item to be in the basket

#### Methods:

#find(id) - will return the voucher with the specified id. This will also raise an error if the id is invalid. This was designed to replicate the ActiveRecord 'find' method.

### Checkout

Found in [lib/checkout.rb](https://github.com/Estevenson1994/Clothes-Store/blob/master/lib/checkout.rb)

This object is created when the user goes to the checkout page.

#### Attributes:

+ cart - stores the cart object containing all the items the user is planning to purchase
+ vouchers - stores any vouchers that the user may have applied

#### Methods:

#apply_voucher(voucher) - adds voucher to the vouchers attribute. This is called when the user types in the voucher id into the text field on the checkout page. [Example](https://github.com/Estevenson1994/Clothes-Store/wiki/How-the-program-works#adding-vouchers)

#remove_voucher(voucher) - removes voucher from checkout

#total_discount - calculates the total discount applied by vouchers

#total_cost - returns the total cost of all items in the basket including any discounts applied

#invalid_voucher_message - this method is called if an invalid voucher is applied. It will return a message explaining to the user why the voucher is invalid.

#voucher_is_invalid(voucher) - returns true if voucher is invalid depending on items in the basket

## Challenges

There were a few challenges I faced while completing this project:

1. I was first trying to design this program where product objects were stored on the cart. However, as the storage space is only 4kb when using sessions, I could only store a small number of products in the cart. Therefore, after some research I found that it is common practise to only store a small portion of the item details in the cart to save space.

I therefore found that I could use a struct object to create a cart item, which uses less memory than a normal object. I also altered the attribute 'quantity' on the struct when duplicate items were added to the basket rather than adding a new object. This also saved space in the cookie, so more items can be added to the basket.

2. To record the number of items in stock, I found it was most efficient to actually manipulate to data rather than store it in a session, due to the reasons from the previous challenge. 

However, I found that when running my tests, the change in data was persiting. Therefore I had tests failing because an action a previous test had performed was changing the data. 

I also found that when I assigned the constant DATA = TEST_PRODUCT_DATA, manipulating DATA within my tests, TEST_PRODUCT_DATA was also manipulated. This is a ruby constant behavour. This meant I couldn't reassign DATA to TEST_PRODUCT_DATA before each test as TEST_PRODUCT_DATA had also changed. 

Therefore I had to come up with a way to reset the data before each test. This is done with [this](https://github.com/Estevenson1994/Clothes-Store/blob/master/spec/reset_test_data.rb) method. 

3. Using restful routes. When removing items from the cart and vouchers from checkout, I would like to use the restful route 'delete' rather than a 'post' request. However, when using a hidden form tag in my views, the app was directing to the corresponding 'post' endpoint and adding items/vouchers instead of removing them. This is something I am still debugging.

## Assumptions

There are a few assumptions I have made whilst building this program:

1. As UI design wasn't a requirement for this exercise, I have kept the front end very basic, only using Bootstrap framework to include responsiveness.  
2. A user can add more than one voucher, and can add the same voucher twice.
3. The criteria for adding a voucher that requires a minimum spend checks the total cost of all items, not including any discounts, if the user has already added a voucher.

These are things I would want to work on next if I was to continue with this project. 





























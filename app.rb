require "sinatra/base"
require "./lib/product"
require "./lib/cart"
require "./lib/cart_item"
require "./lib/checkout"

class ClothesStore < Sinatra::Base
  enable :sessions, :method_overide

  get "/" do
    session[:cart] = Cart.new
    erb :index
  end

  get "/products" do
    @products = Product.all
    @product = Product
    @cart = session[:cart]
    erb :products
  end

  post "/cart/products/:id" do
    item = Product.find(params[:id].to_i)
    cart_item = CartItem.new(item.id, item.category, item.price, 1)
    session[:cart].add_item(cart_item)
    redirect "/products"
  end

  post "/cart/products/:id/delete" do
    item = Product.find(params[:id].to_i)
    cart_item = CartItem.new(item.id, item.category, item.price, 1)
    session[:cart].remove_item(cart_item)
    redirect "/products"
  end

  get "/checkout" do
    @product = Product
    session[:checkout] = Checkout.new(session[:cart])
    @checkout = session[:checkout]
    erb :'checkout'
  end
end

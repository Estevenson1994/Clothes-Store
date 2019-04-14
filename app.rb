require "sinatra/base"
require "sinatra/flash"
require "./lib/product"
require "./lib/cart"
require "./lib/cart_item"
require "./lib/checkout"
require "./lib/voucher"

class ClothesStore < Sinatra::Base
  enable :sessions, :method_overide
  register Sinatra::Flash

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
    if Product.item_is_out_of_stock(params[:id].to_i)
      flash[:notice] = "Sorry, this item is out of stock"
    else
      item = Product.find(params[:id].to_i)
      cart_item = CartItem.new(item.id, item.category, item.price, 1)
      session[:cart].add_item(cart_item)
    end
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
    session[:checkout] = Checkout.new(session[:cart]) if session[:checkout].nil?
    @checkout = session[:checkout]
    erb :checkout
  end

  post "/checkout/voucher/add" do
    unless Voucher.voucher_exists(params[:voucher])
      flash[:notice] = "Invalid voucher code"
    else
      voucher = Voucher.find(params[:voucher])
      if session[:checkout].voucher_is_invalid(voucher)
        flash[:notice] = session["checkout"].invalid_voucher_message(voucher)
      else
        session[:checkout].apply_voucher(voucher)
      end
    end
    redirect "/checkout"
  end
end

require "sinatra/base"
require "./lib/product"

class ClothesStore < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/products" do
    @products = Product.all
    erb :products
  end
end

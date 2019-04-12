require "sinatra/base"

class ClothesStore < Sinatra::Base
  get "/" do
    "Clothes Store"
  end
end

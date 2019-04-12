require "sinatra/base"

class ClothesStore < Sinatra::Base
  get "/" do
    erb :'index'
  end
end

require "active_type"

class Product < ActiveType::Object
  attribute :id, :int
  attribute :name, :string
  attribute :colour, :string
  attribute :gender, :string
  attribute :category, :string
  attribute :price, :float
  attribute :stock, :int
end

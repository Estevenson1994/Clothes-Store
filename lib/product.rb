require "active_type"
require_relative "../data_setup"

class Product < ActiveType::Object
  attribute :id, :int
  attribute :name, :string
  attribute :colour, :string
  attribute :gender, :string
  attribute :category, :string
  attribute :price, :float
  attribute :stock, :int

  def self.all
    DATA.map do |item|
      Product.new(
        id: item[:id],
        name: item[:name],
        colour: item[:colour],
        gender: item[:gender],
        category: item[:category],
        price: item[:price],
        stock: item[:stock],
      )
    end
  end
end

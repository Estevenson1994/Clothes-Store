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
      create_product(item)
    end
  end

  def self.find(id)
    item = DATA.select { |item| item[:id] == id }.first
    create_product(item)
  end

  def self.reduce_stock(id)
    index = DATA.find_index { |item| item[:id] == id }
    DATA[index][:stock] -= 1
  end

  def self.increase_stock(id)
    index = DATA.find_index { |item| item[:id] == id }
    DATA[index][:stock] += 1
  end

  private

  def self.create_product(item)
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

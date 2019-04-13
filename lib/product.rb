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
    index = find_item_index(id)
    raise "Item is out of stock" if item_is_out_of_stock(index)
    DATA[index][:stock] -= 1
  end

  def self.increase_stock(id)
    index = find_item_index(id)
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

  def self.find_item_index(id)
    DATA.find_index { |item| item[:id] == id }
  end

  def self.item_is_out_of_stock(index)
    DATA[index][:stock] <= 0
  end
end

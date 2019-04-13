require_relative "./product"

class Cart
  attr_reader :total_cost, :basket

  def initialize(product = Product)
    @total_cost = 0
    @basket = []
    @product = product
  end

  def add_item(item)
    basket_contains_item(item) ? increase_item_quantity(item) : add_item_to_basket(item)
    @product.reduce_stock(item.id)
    @total_cost += item.price
  end

  def remove_item(item)
    more_than_one(item) ? descrease_item_quantity(item) : remove_item_from_basket(item)
    @total_cost -= item.price
  end

  private

  def basket_contains_item(item)
    @basket.any? { |basket_item| basket_item.id == item.id }
  end

  def more_than_one(item)
    cart_item = @basket.find { |basket_item| basket_item.id == item.id }
    cart_item.more_than_one?
  end

  def increase_item_quantity(item)
    cart_item = @basket.find { |basket_item| basket_item.id == item.id }
    cart_item.increase_quantity
  end

  def descrease_item_quantity(item)
    cart_item = @basket.find { |basket_item| basket_item.id == item.id }
    cart_item.decrease_quantity
  end

  def add_item_to_basket(item)
    @basket << item
  end

  def remove_item_from_basket(item)
    @basket.delete(item)
  end
end

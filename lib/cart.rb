class Cart
  attr_reader :total_cost, :basket

  def initialize
    @total_cost = 0
    @basket = []
  end

  def add_item(item)
    basket_contains_item(item) ? increase_item_quantity(item) : add_item_to_basket(item)
    @total_cost += item.price
  end

  def remove_item(item)
    @basket.delete(item)
    @total_cost -= item.price
  end

  private

  def basket_contains_item(item)
    @basket.any? { |cart_item| cart_item.id == item.id }
  end

  def increase_item_quantity(item)
    cart_item = @basket.find { |cart_item| cart_item.id == item.id }
    cart_item.increase_quantity
  end

  def add_item_to_basket(item)
    @basket << item
  end
end

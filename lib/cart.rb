class Cart
  attr_reader :total_cost, :basket

  def initialize
    @total_cost = 0
    @basket = []
  end

  def add_item(item)
    if @basket.any? { |cart_item| cart_item.id == item.id }
      cart_item = @basket.find { |cart_item| cart_item.id == item.id }
      cart_item.increase_quantity
    else
      @basket << item
    end
    @total_cost += item.price
  end

  def remove_item(item)
    @basket.delete(item)
    @total_cost -= item.price
  end
end

class Cart
  attr_reader :total_cost, :basket

  def initialize
    @total_cost = 0
    @basket = []
  end

  def add_item(item)
    @basket << item
  end

  def remove_item(item)
    @basket.delete(item)
  end
end

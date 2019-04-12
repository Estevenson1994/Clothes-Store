class Checkout
  attr_reader :cart
  def initialize(cart)
    @cart = cart
  end

  def total_item_cost
    @cart.total_cost
  end
end

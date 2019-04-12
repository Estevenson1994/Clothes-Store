class Checkout
  def initialize(cart)
    @cart = cart
  end

  def total_item_cost
    @cart.total_cost
  end
end

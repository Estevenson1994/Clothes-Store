class Checkout
  attr_reader :cart, :vouchers

  def initialize(cart)
    @cart = cart
    @vouchers = []
  end

  def total_item_cost
    @cart.total_cost
  end

  def apply_voucher(voucher)
    @vouchers << voucher
  end
end

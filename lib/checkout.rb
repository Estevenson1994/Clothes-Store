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

  def total_discount
    @vouchers.inject(0) do |discount, voucher|
      discount + voucher.amount
    end
  end

  def total_cost
    total_item_cost - total_discount
  end
end

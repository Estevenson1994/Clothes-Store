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
    raise "Invalid voucher, total cost too low" if invalid_cost(voucher)
    if @cart.basket.any? { |item| item.category == voucher.required_item } || voucher.required_item.nil?
      @vouchers << voucher
    else
      raise "Invalid voucher, cart doesn't contain required item"
    end
  end

  def total_discount
    @vouchers.inject(0) do |discount, voucher|
      discount + voucher.amount
    end
  end

  def total_cost
    total_item_cost - total_discount
  end

  def invalid_cost(voucher)
    total_item_cost < voucher.min_spend
  end
end

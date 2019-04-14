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
    raise "Invalid voucher, cart doesn't contain required item" unless cart_has_valid_items(voucher)

    @vouchers << voucher
  end

  def remove_voucher(voucher)
    @vouchers.delete(voucher)
  end

  def total_discount
    @vouchers.inject(0) do |discount, voucher|
      discount + voucher.amount
    end
  end

  def total_cost
    total_item_cost - total_discount
  end

  def invalid_voucher_message(voucher)
    if invalid_cost(voucher)
      "Invalid voucher, total cost should be above £#{voucher.min_spend}"
    elsif !cart_has_valid_items(voucher)
      "Invalid voucher, cart doesn't contain any #{voucher.required_item}"
    end
  end

  def voucher_is_invalid(voucher)
    invalid_cost(voucher) || !cart_has_valid_items(voucher)
  end

  private

  def invalid_cost(voucher)
    total_item_cost < voucher.min_spend
  end

  def voucher_doesnt_require_item(voucher)
    voucher.required_item.nil?
  end

  def cart_contains_required_item(voucher)
    @cart.basket.any? do |item|
      item.category == voucher.required_item
    end
  end

  def cart_has_valid_items(voucher)
    cart_contains_required_item(voucher) || voucher_doesnt_require_item(voucher)
  end
end

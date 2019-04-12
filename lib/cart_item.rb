CartItem = Struct.new(:id, :category, :price, :quantity) do
  def increase_quantity
    self.quantity += 1
  end

  def decrease_quantity
    self.quantity -= 1
  end

  def more_than_one?
    self.quantity > 1
  end
end

CartItem = Struct.new(:id, :category, :price, :quantity) do
  def increase_quantity
    self.quantity += 1
  end
end

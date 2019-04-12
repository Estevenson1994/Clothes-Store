class Cart
  attr_reader :total_cost, :basket

  def initialize
    @total_cost = 0
    @basket = []
  end
end

require "cart"

RSpec.describe Cart do
  subject(:cart) { described_class.new }

  it "has an initial total cost of 0" do
    expect(cart.total_cost).to eq 0
  end

  it "initially has no items in the basket" do
    expect(cart.basket).to be_empty
  end
end

require "cart"

RSpec.describe Cart do
  let(:womens_shoes) { double :womens_shoes, id: 1, category: "Footwear", price: 42.00, quantity: 1 }
  subject(:cart) { described_class.new }

  it "has an initial total cost of 0" do
    expect(cart.total_cost).to eq 0
  end

  it "initially has no items in the basket" do
    expect(cart.basket).to be_empty
  end

  describe "#add_item" do
    it "adds an item to the basket" do
      cart.add_item(womens_shoes)
      expect(cart.basket).to include(womens_shoes)
    end
  end
end
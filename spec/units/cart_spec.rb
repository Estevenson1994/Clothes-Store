require "cart"

RSpec.describe Cart do
  let(:womens_shoes) { double :womens_shoes, id: 1, category: "Footwear", price: 42.00, quantity: 1 }
  let(:womens_shoes2) { double :womens_shoes2, id: 1, category: "Footwear", price: 42.00, quantity: 1 }
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

    it "adds item price to total_cost" do
      expect { cart.add_item(womens_shoes) }.to change { cart.total_cost }.by 42.00
    end

    it "will not add new item if item is already in the basket" do
      cart.add_item(womens_shoes)
      allow(womens_shoes).to receive(:increase_quantity)
      expect { cart.add_item(womens_shoes2) }.to change { cart.basket.length }.by 0
    end
  end

  describe "#remove_item" do
    it "removes item from the basket" do
      cart.add_item(womens_shoes)
      cart.remove_item(womens_shoes)
      expect(cart.basket).to_not include(womens_shoes)
    end

    it "removes item price from total_cost" do
      cart.add_item(womens_shoes)
      expect { cart.remove_item(womens_shoes) }.to change { cart.total_cost }.by -42.00
    end
  end
end

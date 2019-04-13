require "cart"

RSpec.describe Cart do
  let(:womens_shoes) { double :womens_shoes, id: 1, category: "Footwear", price: 42.00, quantity: 1 }
  let(:womens_shoes2) { double :womens_shoes2, id: 1, category: "Footwear", price: 42.00, quantity: 1 }
  let(:mens_shoes) { double :mens_shoes, id: 1, category: "Footwear", price: 10.00, quantity: 2 }
  let(:product) { double :product }
  subject(:cart) { described_class.new(product) }

  it "has an initial total cost of 0" do
    expect(cart.total_cost).to eq 0
  end

  it "initially has no items in the basket" do
    expect(cart.basket).to be_empty
  end

  describe "#add_item" do
    before(:each) do
      allow(product).to receive(:reduce_stock).with(1, any_args)
    end
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
    before(:each) do
      allow(womens_shoes).to receive(:more_than_one?).and_return(false)
      allow(product).to receive(:reduce_stock).with(1, any_args)
      allow(product).to receive(:increase_stock).with(1, any_args)
    end

    it "removes item from the basket" do
      cart.add_item(womens_shoes)
      cart.remove_item(womens_shoes)
      expect(cart.basket).to_not include(womens_shoes)
    end

    it "removes item price from total_cost" do
      cart.add_item(womens_shoes)
      expect { cart.remove_item(womens_shoes) }.to change { cart.total_cost }.by(-42.00)
    end

    it "doesn't remove item if quantity is greater than 1" do
      cart.add_item(mens_shoes)
      allow(mens_shoes).to receive(:more_than_one?).and_return true
      allow(mens_shoes).to receive(:decrease_quantity)
      expect { cart.remove_item(mens_shoes) }.to change { cart.basket.length }.by 0
    end
  end
end

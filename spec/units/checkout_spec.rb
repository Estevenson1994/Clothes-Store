require "checkout"

RSpec.describe Checkout do
  let(:womens_shoes) { double :womens_shoes, category: "Footware", price: 42.00 }
  let(:mens_shoes) { double :mens_shoes, category: "Footware", price: 10.00 }
  let(:cart) { double :cart, basket: [womens_shoes, mens_shoes], total_cost: 52.00 }
  subject(:checkout) { described_class.new(cart) }

  describe "#total_item_cost" do
    it "returns total cost of all items in cart" do
      expect(checkout.total_item_cost).to eq 52.00
    end
  end
end

require "cart_item"

RSpec.describe CartItem do
  subject(:cart_item) { described_class.new(1, "Footwear", 10, 1) }
  it { is_expected.to have_attributes(id: 1) }
  it { is_expected.to have_attributes(category: "Footwear") }
  it { is_expected.to have_attributes(price: 10) }
  it { is_expected.to have_attributes(quantity: 1) }

  describe "#increase_quantity" do
    it "increases item quantity by 1" do
      expect { cart_item.increase_quantity }.to change { cart_item.quantity }.by 1
    end
  end

  describe "#descrease_quantity" do
    it "decreases item quanity by 1" do
      expect { cart_item.decrease_quantity }.to change { cart_item.quantity }.by(-1)
    end
  end

  describe "#more_than_one" do
    it "returns true if quantity is greater than one" do
      multi_cart_item = CartItem.new(1, "Footwear", 10, 2)
      expect(multi_cart_item).to be_more_than_one
    end

    it "returns false if quantity is one" do
      expect(cart_item).to_not be_more_than_one
    end
  end
end

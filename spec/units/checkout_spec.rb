require "checkout"

RSpec.describe Checkout do
  let(:womens_shoes) { double :womens_shoes, category: "Footware", price: 42.00 }
  let(:mens_shoes) { double :mens_shoes, category: "Footware", price: 10.00 }
  let(:cart) { double :cart, basket: [womens_shoes, mens_shoes], total_cost: 52.00 }
  let(:five_pound_voucher) { double :five_pound_voucher, amount: 5, min_spend: 0, required_item: nil }
  let(:ten_pound_voucher) { double :ten_pound_voucher, amount: 10, min_spend: 50, required_item: nil }
  subject(:checkout) { described_class.new(cart) }

  describe "#total_item_cost" do
    it "returns total cost of all items in cart" do
      expect(checkout.total_item_cost).to eq 52.00
    end
  end

  describe "#apply_voucher" do
    it "adds voucher to list of vouchers" do
      checkout.apply_voucher(five_pound_voucher)
      expect(checkout.vouchers).to include(five_pound_voucher)
    end

    it "raises an error if spend is too low for voucher" do
      cart2 = double(:cart2, basket: [womens_shoes], total_cost: 42.00)
      checkout2 = Checkout.new(cart2)
      expect { checkout2.apply_voucher(ten_pound_voucher) }.to raise_error("Invalid voucher, total cost too low")
    end

    it "adds voucher if total spend is correct" do
      checkout.apply_voucher(ten_pound_voucher)
      expect(checkout.vouchers).to include(ten_pound_voucher)
    end
  end

  describe "#total_discount" do
    it "returns sum of all voucher discounts" do
      checkout.apply_voucher(five_pound_voucher)
      checkout.apply_voucher(ten_pound_voucher)
      expect(checkout.total_discount).to eq 15
    end
  end

  describe "#total_cost" do
    it "returns total cost including discounts" do
      checkout.apply_voucher(five_pound_voucher)
      checkout.apply_voucher(ten_pound_voucher)
      expect(checkout.total_cost).to eq 37
    end
  end
end

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
  end

  describe "#total_discount" do
    it "returns sum of all voucher discounts" do
      checkout.apply_voucher(five_pound_voucher)
      checkout.apply_voucher(ten_pound_voucher)
      expect(checkout.total_discount).to eq 15
    end
  end

end

require "voucher"

RSpec.describe Voucher do
  subject(:voucher) { described_class.new(id: "Fifteen", amount: 15, min_spend: 75, required_item: "Footwear") }
  it { is_expected.to have_attributes(id: "Fifteen") }
  it { is_expected.to have_attributes(amount: 15) }
  it { is_expected.to have_attributes(min_spend: 75) }
  it { is_expected.to have_attributes(required_item: "Footwear") }

  describe "#find" do
    it "returns voucher with given id" do
      voucher = Voucher.find("Five")
      expect(voucher).to have_attributes(id: "Five", amount: 5, min_spend: 0, required_item: nil)
    end

    it "raises error if incorrect id is given" do
      expect { Voucher.find("not an id") }.to raise_error("Invalid voucher id")
    end
  end
end

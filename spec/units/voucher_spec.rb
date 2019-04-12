require "voucher"

RSpec.describe Voucher do
  subject(:voucher) { described_class.new(id: "Fifteen", amount: 15, min_spend: 75, required_item: "Footwear") }
  it { is_expected.to have_attributes(id: "Fifteen") }
  it { is_expected.to have_attributes(amount: 15) }
  it { is_expected.to have_attributes(min_spend: 75) }
  it { is_expected.to have_attributes(required_item: "Footwear") }
end

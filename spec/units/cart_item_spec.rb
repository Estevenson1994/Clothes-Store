require "cart_item"

RSpec.describe CartItem do
  subject(:cart_item) { described_class.new(1, "Footwear", 10, 1) }
  it { is_expected.to have_attributes(id: 1) }
  it { is_expected.to have_attributes(category: "Footwear") }
  it { is_expected.to have_attributes(price: 10) }
  it { is_expected.to have_attributes(quantity: 1) }
end

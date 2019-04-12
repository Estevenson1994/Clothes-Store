require "product"

RSpec.describe Product do
  subject(:womens_shoes) { described_class.new(id: 1, name: "Suede Shoes", colour: "Blue", gender: "Women", category: "Footwear", price: 99.00, stock: 5) }
  it { is_expected.to have_attributes(id: 1) }
  it { is_expected.to have_attributes(name: "Suede Shoes") }
  it { is_expected.to have_attributes(colour: "Blue") }
  it { is_expected.to have_attributes(gender: "Women") }
  it { is_expected.to have_attributes(category: "Footwear") }
  it { is_expected.to have_attributes(price: 99.00) }
  it { is_expected.to have_attributes(stock: 5) }
end
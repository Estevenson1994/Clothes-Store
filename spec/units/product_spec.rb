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

  describe "#all" do
    it "returns all items" do
      items = Product.all
      expect(items.length).to eq 13
      expect(items.first).to be_a Product
      expect(items.first.name).to eq "Almond Toe Court Shoes"
    end
  end

  describe "#find" do
    it "returns item with specified id" do
      item = Product.find(1)
      expect(item).to have_attributes(id: 1)
      expect(item).to have_attributes(name: "Almond Toe Court Shoes")
      expect(item).to have_attributes(colour: "Patent Black")
      expect(item).to have_attributes(gender: "Women")
      expect(item).to have_attributes(category: "Footwear")
      expect(item).to have_attributes(price: 99.00)
      expect(item).to have_attributes(stock: 5)
    end
  end

  describe "#reduce_stock" do
    it "reduces item stock by one" do
      original_stock = Product.find(1).stock
      Product.reduce_stock(1)
      final_stock = Product.find(1).stock
      expect(original_stock - final_stock).to eq 1
    end

    it "raises an error if item is out of stock" do
      expect { Product.reduce_stock(5) }.to raise_error("Item is out of stock")
    end
  end

  describe "#increase_stock" do
    it "increases item stock by one" do
      original_stock = Product.find(1).stock
      Product.increase_stock(1)
      final_stock = Product.find(1).stock
      expect(original_stock - final_stock).to eq -1
    end
  end
end

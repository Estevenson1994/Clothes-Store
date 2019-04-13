module Helpers
  def enter_product_page
    visit "/"
    click_button("View Products")
  end

  def add_first_item_to_basket
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
  end

  def remove_first_item_from_basket
    within ".shopping_cart" do
      click_button("Remove from basket", :match => :first)
    end
  end

  def try_add_out_of_stock_item_to_basket
    within "#product-5" do
      click_button("Add to basket")
    end
  end

  def checkout_and_add_voucher(voucher)
    click_button("Checkout")
    fill_in "voucher", :with => voucher
    click_button("add")
  end

  def add_item_to_basket_that_costs_less_than_50
    within "#product-3" do
      click_button("Add to basket")
    end
  end

  def add_non_footwear_item_to_basket
    within "#product-12" do
      click_button("Add to basket")
    end
  end
end

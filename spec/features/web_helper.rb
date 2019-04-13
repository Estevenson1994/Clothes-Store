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
end

module Helpers
  def enter_product_page
    visit "/"
    click_button("View Products")
  end
end

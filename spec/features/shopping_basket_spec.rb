require_relative "./web_helper"

feature "Shopping Basket" do
  include Helpers
  scenario "user can add item to basket and see it in the cart" do
    enter_product_page
    add_first_item_to_basket
    expect(page).to have_content("Shopping Cart")
    expect(page.find(".shopping_cart")).to have_selector("li", count: 1)
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 1")
  end

  scenario "user can remove item from the basket" do
    enter_product_page
    add_first_item_to_basket
    within ".shopping_cart" do
      click_button("Remove from basket", :match => :first)
    end
    expect(page).to have_content("Shopping Cart")
    expect(page.find(".shopping_cart")).to have_selector("li", count: 0)
    expect(page).to_not have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 1")
  end

  scenario "shows total cost of all items in the basket" do
    enter_product_page
    add_first_item_to_basket
    add_first_item_to_basket
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 2")
  end

  scenario "item price is subtracted when removed from the basket" do
    enter_product_page
    add_first_item_to_basket
    add_first_item_to_basket
    within ".shopping_cart" do
      click_button("Remove from basket", :match => :first)
    end
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 1")
  end

  scenario "user cannot add item that is out of stock to basket" do
    enter_product_page
    within "#product-5" do
      click_button("Add to basket")
    end

    expect(page).to have_content("Sorry, this item is out of stock")
    expect(page).to_not have_content("Flip Flops in Blue - £19.00, quantity: 1")
  end
end

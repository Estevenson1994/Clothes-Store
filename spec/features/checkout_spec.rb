require_relative "./web_helper"

feature "Checkout" do
  include Helpers
  scenario "shows all items and total cost of all items in the basket" do
    enter_product_page
    add_first_item_to_basket
    add_first_item_to_basket
    click_button("Checkout")
    expect(page).to have_content("Checkout\n")
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 2")
    expect(page).to have_content("Total item cost: £198.00")
  end

  scenario "can add voucher at checkout and see the discount" do
    enter_product_page
    add_first_item_to_basket
    add_first_item_to_basket
    checkout_and_add_voucher("Five")
    expect(page).to have_content("Discounts:")
    expect(page).to have_content("Five, discount: - £5.00")
    expect(page).to have_content("Total discount: - £5.00")
    expect(page).to have_content("Total including discounts: £193.00")
  end

  scenario "user cannot add voucher if spend is too low" do
    enter_product_page
    add_item_to_basket_that_costs_less_than_50
    checkout_and_add_voucher("Ten")
    expect(page).to have_content("Invalid voucher, total cost should be above £50")
  end

  scenario "user cannot add voucher if cart doesnt contain required item" do
    enter_product_page
    add_non_footwear_item_to_basket
    checkout_and_add_voucher("Fifteen")
    expect(page).to have_content("Invalid voucher, cart doesn't contain any Footwear")
  end
end

feature "Checkout" do
  scenario "can add voucher at checkout and see the discount" do
    visit "/"
    click_button("View Products")
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    within ".products" do
      click_button("Add to basket", :match => :first)
    end

    click_button("Checkout")
    fill_in "voucher", :with => "Five"
    click_button("add")

    expect(page).to have_content("Discounts:")
    expect(page).to have_content("Five, discount: - £5.00")
    expect(page).to have_content("Total discount: - £5.00")
    expect(page).to have_content("Total including discounts: £193.00")
  end
end
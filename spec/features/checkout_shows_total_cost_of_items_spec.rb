feature "Checkout" do
  scenario "shows all items and total cost of all items in the basket" do
    visit "/"
    click_button("View Products")
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    within ".products" do
      click_button("Add to basket", :match => :first)
    end

    click_button("Checkout")
    expect(page).to have_content("Checkout\n")
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 2")
    expect(page).to have_content("Total item cost: £198.00")
  end
end

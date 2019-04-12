feature "Shopping Basket" do
  scenario "shows total cost of all items in the basket" do
    visit "/"
    click_button("View Products")
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 2")
  end

  scenario "item price is subtracted when removed from the basket" do
    visit "/"
    click_button("View Products")
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    within ".shopping_cart" do
      click_button("Remove from basket", :match => :first)
    end
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 1")
  end
end

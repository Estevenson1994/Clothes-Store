feature "Shopping Basket" do
  scenario "user can add item to basket and see it in the cart" do
    visit "/"
    click_button("View Products")
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    expect(page).to have_content("Shopping Cart")
    expect(page.find(".shopping_cart")).to have_selector("li", count: 1)
    expect(page).to have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 1")
  end

  scenario "user can remove item from the basket" do
    visit "/"
    click_button("View Products")
    within ".products" do
      click_button("Add to basket", :match => :first)
    end
    within ".shopping_cart" do
      click_button("Remove from basket", :match => :first)
    end
    expect(page).to have_content("Shopping Cart")
    expect(page.find(".shopping_cart")).to have_selector("li", count: 0)
    expect(page).to_not have_content("Almond Toe Court Shoes in Patent Black - £99.00, quantity: 1")
  end

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

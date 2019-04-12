
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
    expect(page).to have_content("Total Cost:\n£198.00")
  end
end

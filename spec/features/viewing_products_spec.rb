feature "Viewing Products" do
  feature "visiting the homepage" do
    scenario "Can see 'Clothes Store' on homepage" do
      visit "/"

      expect(page).to have_content "Clothes Store"
    end
  end

  feature "viewing products" do
    scenario "all products are visable" do
      visit "/"
      click_button("View Products")
      expect(page).to have_content("Items Available:")
      expect(page.find(".products")).to have_selector("li", count: 13)
      expect(page).to have_content("Women's Footwear: Almond Toe Court Shoes in Patent Black - £99.00, total stock: 5")
    end
  end
end

feature "Viewing Products" do
  feature "visiting the homepage" do
    scenario "Can see 'Clothes Store' on homepage" do
      visit "/"

      expect(page).to have_content "Clothes Store"
    end
  end
end

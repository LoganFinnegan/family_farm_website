# spec/features/admin/products_spec.rb
require "rails_helper"

RSpec.describe "Admin::Products", type: :feature do
  let!(:admin) { create(:user, :admin) }   # assuming you have a user factory with an :admin trait
  let!(:product) { create(:product, name: "Fresh Honey", price: 10.0) }

  before do
    login_as(admin, scope: :user)  # Warden helper
  end

  scenario "Admin visits products index and sees a product" do
    visit admin_products_path

    expect(page).to have_content("Products")
    expect(page).to have_content("Fresh Honey")
    expect(page).to have_content("$10.00")
  end

  scenario "Admin clicks on a product and sees the details" do
    visit admin_products_path
    click_link "Show", match: :first

    expect(page).to have_content("Fresh Honey")
    expect(page).to have_content("$10.00")
    expect(page).to have_content(product.description)
  end

  scenario "Admin creates a new product" do
    visit admin_products_path
    click_link "New Product"

    fill_in "Name", with: "Farm Eggs"
    fill_in "Description", with: "Fresh organic eggs from our farm."
    fill_in "Price", with: 4.50
    fill_in "Stock", with: 12
    click_button "Create Product"

    expect(page).to have_content("Product created!")
    expect(page).to have_content("Farm Eggs")
    expect(page).to have_content("$4.50")
  end
end

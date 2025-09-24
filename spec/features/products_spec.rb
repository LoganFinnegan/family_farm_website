require "rails_helper"

RSpec.describe "Products", type: :feature do
  let!(:product) { create(:product, name: "Fresh Honey", price: 10.0) }

  scenario "User visits products index and sees a product" do
    visit products_path

    expect(page).to have_content("Our Products")
    expect(page).to have_content("Fresh Honey")
    expect(page).to have_content("$10.00")
  end

  scenario "User clicks on a product and sees the details" do
    visit products_path
    click_link "Fresh Honey"

    expect(page).to have_content("Fresh Honey")
    expect(page).to have_content(product.description.truncate(20, omission: "")) # optional
    expect(page).to have_content("$10.00")
  end
end

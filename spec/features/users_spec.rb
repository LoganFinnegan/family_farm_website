require "rails_helper"

RSpec.describe "User Authentication", type: :feature do
  let!(:user) { create(:user, email: "user@example.com", password: "password123") }
  let!(:admin) { create(:user, email: "admin@example.com", password: "password123", admin: true) }

  scenario "User signs up with valid credentials" do
    visit new_user_registration_path

    fill_in "Email", with: "newuser@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully")
    expect(User.last.email).to eq("newuser@example.com")
  end

  scenario "User logs in with valid credentials" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Logout")
  end

  scenario "User cannot log in with invalid credentials" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password")
  end

  scenario "User logs out successfully" do
    login_as(user, scope: :user)  # Warden test helper
    visit root_path

    click_link "Logout"
    expect(page).to have_content("Login")
  end

  scenario "Admin can access admin dashboard" do
    login_as(admin, scope: :user)
    visit admin_root_path

    expect(page).to have_content("Admin Dashboard")
  end

  scenario "Regular user cannot access admin dashboard" do
    login_as(user, scope: :user)
    visit admin_root_path

    expect(page).to have_content("You are not authorized to access this page")
  end
end

# spec/features/admin/events_spec.rb
require "rails_helper"

RSpec.describe "Admin::Events", type: :feature do
  let!(:admin) { create(:user, :admin) }
  let!(:event) { create(:event, title: "Farm Festival", location: "Finnegan Farms", cost: "Free") }

  before do
    login_as(admin, scope: :user)  # Devise/Warden helper
  end

  scenario "Admin visits events index and sees an event" do
    visit admin_events_path

    expect(page).to have_content("Events")
    expect(page).to have_content("Farm Festival")
    expect(page).to have_content("Finnegan Farms")
  end

  scenario "Admin clicks on an event and sees the details" do
    visit admin_events_path
    click_link "Show", match: :first

    expect(page).to have_content("Farm Festival")
    expect(page).to have_content("Finnegan Farms")
    expect(page).to have_content("Free")
  end

  scenario "Admin creates a new event" do
    visit new_admin_event_path

    fill_in "Title", with: "Harvest Festival"
    fill_in "Description", with: "Celebrate the harvest with food and music."

    future_time = 2.weeks.from_now.change(sec: 0)

    select future_time.year.to_s, from: "event_date_1i"
    select future_time.strftime("%B"), from: "event_date_2i"
    select future_time.day.to_s, from: "event_date_3i"
    select future_time.strftime("%H"), from: "event_date_4i"   # 24-hour format
    select future_time.strftime("%M"), from: "event_date_5i"

    fill_in "Location", with: "Farm Grounds"
    fill_in "Cost", with: "Free"

    click_button "Create Event"

    expect(page).to have_content("Harvest Festival")
    expect(page).to have_content("Farm Grounds")
  end

  scenario "Admin updates an event" do
    visit edit_admin_event_path(event)

    fill_in "Title", with: "Updated Festival"
    click_button "Update Event"

    expect(page).to have_content("Updated Festival")
  end

  scenario "Admin deletes an event" do
    visit admin_events_path

    click_link "Delete", match: :first

    expect(page).not_to have_content("Farm Festival")
  end
end

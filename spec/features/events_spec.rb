require "rails_helper"

RSpec.describe "Events", type: :feature do
  let!(:event) { create(:event) }

  scenario "User visits events index and sees an event" do
    visit events_path

    expect(page).to have_content("Upcoming Events")
    expect(page).to have_content(event.title)     # dynamic
    expect(page).to have_content(event.location)  # dynamic
  end

  scenario "User clicks on an event and sees the details" do
    visit events_path
    click_link event.title   # dynamic

    expect(page).to have_content(event.title)
    expect(page).to have_content(event.description)
    expect(page).to have_content(event.cost)
  end
end

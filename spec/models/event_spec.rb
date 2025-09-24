require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      event = Event.new(
        title: "Farm Festival",
        description: "A fun day at the farm",
        date: Time.current + 1.day,
        location: "Finnegan Farms",
        cost: "Free"
      )
      expect(event).to be_valid
    end

    it "is invalid without a title" do
      event = Event.new(title: nil)
      expect(event).not_to be_valid
    end

    it "is invalid without a description" do
      event = Event.new(description: nil)
      expect(event).not_to be_valid
    end

    it "is invalid without a date" do
      event = Event.new(date: nil)
      expect(event).not_to be_valid
    end

    it "is invalid without a location" do
      event = Event.new(location: nil)
      expect(event).not_to be_valid
    end

    it "is invalid without a cost" do
      event = Event.new(cost: nil)
      expect(event).not_to be_valid
    end
  end

  describe "scopes" do
    before do
      @upcoming = Event.create!(title: "Upcoming", description: "A longer test description", date: 1.day.from_now, location: "Farm", cost: "Free")
      @past = Event.create!(title: "Past", description: "Another valid description", date: 1.day.ago, location: "Farm", cost: "Free")
    end

    it "returns only upcoming events" do
      expect(Event.upcoming).to include(@upcoming)
      expect(Event.upcoming).not_to include(@past)
    end

    it "returns only past events" do
      expect(Event.past).to include(@past)
      expect(Event.past).not_to include(@upcoming)
    end
  end
end

FactoryBot.define do
  factory :event do
    title { Faker::Music::RockBand.name }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    date { 1.week.from_now }
    location { Faker::Address.city }
    cost { ["Free", "$5", "$10", "$20"].sample }

    trait :upcoming do
      date { 1.week.from_now }
    end

    trait :past do
      date { 1.week.ago }
    end
  end
end

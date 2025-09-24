# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 10) }
    price { Faker::Commerce.price(range: 5.0..50.0) }
    stock { rand(0..10) }

    trait :in_stock do
      stock { 5 }
    end

    trait :out_of_stock do
      stock { 0 }
    end
  end
end

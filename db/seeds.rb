require "faker"
require "open-uri"

puts "Clearing old data..."
Event.destroy_all
Product.destroy_all   # was Merch.destroy_all

# Seed Events
puts "Creating events..."
5.times do
  event = Event.create!(
    title: Faker::Music::RockBand.name + " Concert",
    description: Faker::Lorem.paragraph(sentence_count: 4),
    date: Faker::Time.forward(days: 30, period: :evening),
    location: Faker::Address.city,
    cost: ["Free", "$5", "$10", "$20"].sample
  )

  # Attach a random placeholder image
  file = URI.open("https://picsum.photos/800/400?random=#{rand(1000)}")
  event.flyer.attach(io: file, filename: "event#{event.id}.jpg", content_type: "image/jpg")
end

# Seed Products
puts "Creating products..."
5.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 15),
    price: Faker::Commerce.price(range: 5.0..50.0),
    stock: rand(0..50)
  )

  # Attach a random placeholder image
  file = URI.open("https://picsum.photos/400/400?random=#{rand(1000)}")
  product.image.attach(io: file, filename: "product#{product.id}.jpg", content_type: "image/jpg")
end

if Rails.env.development? || Rails.env.test?
  puts "Seeding admin user for dev/test..."
  User.find_or_create_by!(email: "test@ff.com") do |user|
    user.password = "pass123"
    user.password_confirmation = "pass123"
    user.admin = true
  end
end


puts "Seeding complete!"

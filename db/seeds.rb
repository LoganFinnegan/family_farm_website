# db/seeds.rb
require "faker"
require "open-uri"

puts "== Seeding: start =="

# ----------------------------
# Helpers
# ----------------------------
def attach_remote_image(record, attachment_name, url, filename:, content_type: "image/jpeg")
  file = URI.open(url)
  record.public_send(attachment_name).attach(
    io: file,
    filename: filename,
    content_type: content_type
  )
rescue => e
  warn "⚠️  Could not attach image to #{record.class}##{attachment_name}: #{e.message}"
end

# ----------------------------
# Reset demo data (safe order)
# ----------------------------
puts "Clearing old data..."
Event.destroy_all
Product.destroy_all
# (We keep users and page_content so your login/admin stays intact.)

# ----------------------------
# Events
# ----------------------------
puts "Creating events..."
5.times do
  event = Event.create!(
    title: "#{Faker::Music::RockBand.name} Concert",
    description: Faker::Lorem.paragraph(sentence_count: 4),
    date: Faker::Time.forward(days: 30, period: :evening),
    location: Faker::Address.city,
    cost: ["Free", "$5", "$10", "$20"].sample
  )

  attach_remote_image(
    event,
    :flyer,
    "https://picsum.photos/800/400?random=#{rand(1000)}",
    filename: "event#{event.id}.jpg"
  )
end

# ----------------------------
# Products
# ----------------------------
puts "Creating products..."
5.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 15),
    price: Faker::Commerce.price(range: 5.0..50.0),
    stock: rand(0..50)
  )

  attach_remote_image(
    product,
    :image,
    "https://picsum.photos/400/400?random=#{rand(1000)}",
    filename: "product#{product.id}.jpg"
  )
end

# ----------------------------
# Dev/Test Admin user
# ----------------------------
if Rails.env.development? || Rails.env.test?
  puts "Ensuring dev/test admin user exists..."
  User.find_or_create_by!(email: "test@ff.com") do |user|
    user.password = "pass123"
    user.password_confirmation = "pass123"
    user.admin = true
  end
end

# ----------------------------
# Page Content (Welcome)
# ----------------------------
puts "Upserting welcome page content..."
welcome = PageContent.find_or_initialize_by(slug: "welcome_page")
welcome.title      = welcome.title.presence   || "Welcome to Finnegan Farms"
welcome.subtitle   = welcome.subtitle.presence|| "Rooted in tradition, growing in excellence – explore our events, our products, and our services."
welcome.body       = welcome.body.presence    || ""  # optional HTML/body if you want later
welcome.text_color = welcome.text_color.presence || "light" # "light" or "dark"
welcome.save!

unless welcome.hero_image.attached?
  attach_remote_image(
    welcome,
    :hero_image,
    "https://picsum.photos/1200/600?random=42",
    filename: "welcome_hero.jpg"
  )
end

puts "== Seeding: complete =="
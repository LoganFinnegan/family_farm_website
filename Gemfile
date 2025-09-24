source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.4'

# Core Rails
gem 'rails', '~> 8.0.3'
gem 'pg', '~> 1.1'             # PostgreSQL adapter
gem 'puma', '>= 5.0'           # App server
gem "bootstrap", "~> 5.3"
gem 'sass-rails', '~> 6'       # SCSS support
gem 'importmap-rails'
gem 'turbo-rails'              # Hotwire Turbo (default in Rails 7)
gem 'stimulus-rails'           # Hotwire Stimulus
gem 'bootsnap', '>= 1.4.4', require: false
gem 'ransack'


# File uploads / images (via ActiveStorage)
gem 'image_processing', '~> 1.2'
gem 'mini_magick'

# Authentication & URLs
gem 'devise'
gem 'friendly_id'

group :development do
  gem 'web-console', '>= 4.1.0'  # Debug console in the browser
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'launchy'
  gem 'orderly'
  gem 'pry'
  gem 'simplecov'
  gem 'rubocop-rails'
  gem 'faker'
end

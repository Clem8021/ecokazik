source "https://rubygems.org"

ruby "3.3.5"

gem "rails", "~> 8.0.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "sprockets-rails"
gem "sassc-rails"
gem "bootsnap", require: false
gem "devise", "~> 4.9"

# Supprimé rails_12factor (obsolète)

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem 'rails_12factor' # si Rails < 5
end

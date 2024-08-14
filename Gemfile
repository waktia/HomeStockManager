source "https://rubygems.org"

ruby "3.2.1"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false


gem "bootstrap-sass"
gem "sassc-rails"
gem "bcrypt"
gem "whenever", require: false

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "dotenv-rails"
end

group :development do

  gem "web-console"

end

group :test do

  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem "pg", "~> 1.4"
  end

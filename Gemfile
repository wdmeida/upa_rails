source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff
gem 'rails-i18n', '~> 5.0.0'
# Help ActiveRecord::Enum feature to work fine with I18n and simple_form. 
gem 'enum_help'
# Flexible authentication solution for Rails with Warden. 
gem 'devise'
# Translations for the devise gem 
gem 'devise-i18n'
# Paginação.
gem 'kaminari'
# Quick Bootstrap 4 styling (tested for bootstrap 4.0.0.alpha3) for Kaminari
gem 'bootstrap4-kaminari-views'
# Kaminari i18n
gem 'kaminari-i18n'
# jQuery UI for the Rails asset pipeline 
gem 'jquery-ui-rails'
# Object-based searching
gem 'ransack'
# Integration of RubyMoney - Money with Rails 
gem 'money-rails', '~>1'
# A kickass library to manage your poppers
gem 'popper_js', '~> 1.12.3'

# Rails Assets
source 'https://rails-assets.org' do
  # Assets bootstrap
  gem 'rails-assets-bootstrap', '4.0.0.beta'
  # NotifyJS
  gem 'rails-assets-notifyjs'
  # A client-side library to make absolutely positioned elements attach to elements in the page efficiently.
  gem 'rails-assets-tether'
  # BootboxJS. Library for box confirmation and messages.
  gem 'rails-assets-bootbox'
  # jQuery plugin select date and time.
  gem 'rails-assets-datetimepicker'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  # RSpec for Rails-3
  gem 'rspec-rails', '~> 3.6'
  # A library for generating fake data such as names, addresses, and phone numbers. 
  gem 'faker'
end

group :test do
  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing. 
  gem 'database_cleaner'
  # Collection of testing matchers extracted from Shoulda.
  gem 'shoulda-matchers', '~> 3.1'
  # factory_girl is a fixtures replacement with a straightforward definition syntax
  gem 'factory_girl_rails'
  # Adding methods from controller-testing
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Preloader from rspec
  gem 'spring-commands-rspec'
  # Better error page for Rack apps
  gem "better_errors"
  # Manage Procfile-based applications
  gem 'foreman'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

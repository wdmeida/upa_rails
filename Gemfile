source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'puma'
gem 'rails', '= 5.2.4'
gem 'sqlite3'

gem 'bootstrap4-kaminari-views'
gem 'chartkick'
gem 'coffee-rails'
gem 'devise'
gem 'devise-i18n'
gem 'enum_help'
gem 'font-awesome-rails'
gem 'friendly_id'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'money-rails', '~>1'
gem 'popper_js', '~> 1.12.3'
gem 'rails-i18n'
gem 'ransack'
gem 'redcarpet'
gem 'sass-rails'
gem 'uglifier'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootbox'
  gem 'rails-assets-bootstrap', '4.0.0.beta'
  gem 'rails-assets-datetimepicker'
  gem 'rails-assets-inputmask'
  gem 'rails-assets-notifyjs'
  gem 'rails-assets-tether'
end

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'cpf_faker'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

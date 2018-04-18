require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Upa
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # Config time_zone
    config.time_zone = 'Brasilia'
    
    # Config locale
    config.i18n.default_locale = :"pt-BR"

    # Config SQL warning error representation boolean as integer
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end

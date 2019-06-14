require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MagicStroy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    config.i18n.load_path += Dir[Rails.root.join('config','locales','chinese', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:"zh-CN", :en]
    config.i18n.default_locale = :"zh-CN"
    config.time_zone = 'Beijing'
    config.encoding = 'utf-8'

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :put, :patch, :delete, :head]
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

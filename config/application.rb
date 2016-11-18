require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wencessz
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.encoding = "utf-8"

    config.i18n.default_locale = :es

    config.paperclip_defaults = {
        styles: { :large => "500x470>", :medium => "300x220#", :thumb => "100x100#" },
        default_url: "Sin_imagen_disponible.jpg"
    }
  end
end

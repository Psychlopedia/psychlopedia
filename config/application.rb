require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Psychlopedia
  class Application < Rails::Application
    console do
      require "pry"
      config.console = Pry
      unless defined? Pry::ExtendCommandBundle
          Pry::ExtendCommandBundle = Module.new
      end
      require "rails/console/app"
      require "rails/console/helpers"
      TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
    end
    config.autoload_paths += %W(#{config.root}/lib)
    I18n.enforce_available_locales = false
  end
end

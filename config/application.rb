require_relative "boot"

require "rails/all"

require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Ecokazik
  class Application < Rails::Application
    config.autoload_lib(ignore: %w[assets tasks])
    config.active_job.queue_adapter = :async
  end
end

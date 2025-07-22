# config/environments/production.rb
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code reload désactivé en prod.
  config.enable_reloading = false
  config.eager_load = true

  # Pas d'erreurs détaillées en prod.
  config.consider_all_requests_local = false

  # Cache activé.
  config.action_controller.perform_caching = true

  # Servir les fichiers statiques (Heroku dépend de ENV).
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }

  # Stockage fichiers (éphémère sur Heroku !)
  config.active_storage.service = :local
  # TODO: passe à :amazon ou autre pour du durable.

  # SSL (Heroku : ok)
  config.assume_ssl = true
  config.force_ssl  = true

  # Logs
  config.log_tags = [ :request_id ]
  logger        = Logger.new($stdout, level: ENV.fetch("RAILS_LOG_LEVEL", "info"))
  logger.formatter = ::Logger::Formatter.new
  config.logger = ActiveSupport::TaggedLogging.new(logger)

  # Cache store (pas solid_cache si gem retirée)
  config.cache_store = :memory_store

  # Queue adapter simple (on a retiré solid_queue)
  config.active_job.queue_adapter = :async

  # Dépréciations : on ne spam pas la prod
  config.active_support.report_deprecations = false

  # Mailer (host dynamique)
  config.action_mailer.default_url_options = {
    host: ENV.fetch("APP_HOST", "ecokazik-app.herokuapp.com"),
    protocol: "https"
  }

  # Localisation
  config.i18n.fallbacks = true

  # Ne pas dumper le schéma après migration
  config.active_record.dump_schema_after_migration = false
  config.hosts << "ecolazik.com"
config.hosts << "www.ecolazik.com"

config.action_mailer.default_url_options = { host: "ton-domaine.com", protocol: "https" }
end

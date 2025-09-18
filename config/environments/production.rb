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

  # Servir les fichiers statiques (Heroku utilise cette variable ENV).
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.year.to_i}"
  }

  # Stockage fichiers (éphémère sur Heroku !)
  config.active_storage.service = :local
  # 👉 change plus tard vers :amazon / :google / :cloudinary

  # SSL
  config.assume_ssl = true
  config.force_ssl  = false

  # Logs
  config.log_tags = [:request_id]
  logger = Logger.new($stdout, level: ENV.fetch("RAILS_LOG_LEVEL", "info"))
  logger.formatter = ::Logger::Formatter.new
  config.logger = ActiveSupport::TaggedLogging.new(logger)

  # Cache en mémoire
  config.cache_store = :memory_store

  # Jobs
  config.active_job.queue_adapter = :async

  # Dépréciations : silence en prod
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

  # Hosts autorisés
  config.hosts << "ecolazik.com"
  config.hosts << "www.ecolazik.com"

  # 🚨 Supprimé car inutile avec Propshaft :
  # config.assets.compile = false
  # config.assets.digest = true
end

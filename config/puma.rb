# Puma configuration file for Render

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

port        ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }

# Nombre de workers (processus) - adapté aux serveurs avec plusieurs cœurs
# Render recommande de démarrer avec 2 workers si ton plan le permet
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Preload pour améliorer les performances en production
preload_app!

plugin :tmp_restart

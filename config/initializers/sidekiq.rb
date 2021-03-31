Sidekiq.configure_server do |config|
  config.redis = { host: ENV.fetch("REDIS_HOST") }
end

Sidekiq.configure_client do |config|
  config.redis = { host: ENV.fetch("REDIS_HOST") }
end

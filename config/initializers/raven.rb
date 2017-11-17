if Rails.env.production? and ENV["RAVEN_DSN"].present?
  Raven.configure do |config|
    config.dsn = ENV["RAVEN_DSN"]
  end
end

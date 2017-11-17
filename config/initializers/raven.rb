if Rails.env.production?
  Raven.configure do |config|
    config.dsn = ENV["RAVEN_DSN"]
  end
end

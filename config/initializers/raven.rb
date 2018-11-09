if (Rails.env.production? || Rails.env.staging?) && ENV["RAVEN_DSN"].present?
  Raven.configure do |config|
    config.dsn = ENV["RAVEN_DSN"]
  end
end

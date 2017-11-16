ActionMailer::Base.default_url_options = {
  host: ENV.fetch("MAILER_HOST", "localhost:5000"),
  protocol: "http",
}

if %w(production staging).include?(Rails.env)
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    user_name: ENV.fetch("MAILER_USERNAME"),
    password: ENV.fetch("MAILER_PASSWORD"),
    domain: ENV.fetch("MAILER_DOMAIN"),
    address: ENV.fetch("MAILER_ADDRESS"),
    port: ENV.fetch("MAILER_PORT").to_i,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

ActionMailer::Base.default_url_options = {
  host: Rails.application.secrets.mailer_host,
  protocol: "http",
}

if %w(production staging).include?(Rails.env)
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    user_name: Rails.application.secrets.mailer_username,
    password: Rails.application.secrets.mailer_password,
    domain: Rails.application.secrets.mailer_domain,
    address: Rails.application.secrets.mailer_address,
    port: Rails.application.secrets.mailer_port,
    :authentication => :plain,
    :enable_starttls_auto => true,
    tls: true
  }
end

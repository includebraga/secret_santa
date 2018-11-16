Rails.application.configure do
  config.google_sign_in.client_id = ENV['GOOGLE_OAUTH_CLIENT_ID']
  config.google_sign_in.client_secret = ENV['GOOGLE_OAUTH_CLIENT_SECRET']
end

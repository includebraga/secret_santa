if %i(production staging).include?(Rails.env) && ENV["BASIC_AUTH"].present?
  config.middleware.use '::Rack::Auth::Basic' do |u, p|
    [username, password] == ENV["BASIC_AUTH"].split(":")
  end
end

if %w(production staging).include?(Rails.env) && ENV["BASIC_AUTH"].present?
  Rails.application.configure do
    config.middleware.use Rack::Auth::Basic do |username, password|
      [username, password] == ENV["BASIC_AUTH"].split(":")
    end
  end
end

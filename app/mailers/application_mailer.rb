class ApplicationMailer < ActionMailer::Base
  FROM_NAME = Rails.application.secrets.mailer_from_name.freeze
  FROM_EMAIL = Rails.application.secrets.mailer_from_email.freeze

  default from: "#{FROM_NAME} <#{FROM_EMAIL}>"
  default "Message-ID" => -> { "<#{SecureRandom.uuid}@#{ENV['HOST_DOMAIN']}>" }
  layout "mailer"
end

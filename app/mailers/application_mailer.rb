class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_FROM_NAME") + "<#{ENV.fetch('MAILER_FROM_EMAIL')}>"
  layout "mailer"
end

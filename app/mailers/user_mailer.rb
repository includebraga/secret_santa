class UserMailer < ApplicationMailer
  def new_user(user)
    @confirmation_url = users_confirmation_url(user.confirmation_token)

    mail to: user.email, subject: "[Secret Santa] Confirma o teu email"
  end

  def confirmation_reminder(user)
    @confirmation_url = users_confirmation_url(user.confirmation_token)
    @user = user

    mail to: user.email, subject: "[Secret Santa] Confirma o teu email"
  end
end

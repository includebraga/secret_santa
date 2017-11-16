class UserMailer < ApplicationMailer
  def new_user(user)
    @confirmation_url = users_confirmation_url(user.confirmation_token)

    mail to: user.email, subject: "[Secret Santa] Confirm your email"
  end
end

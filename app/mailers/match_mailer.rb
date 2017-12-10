class MatchMailer < ApplicationMailer
  add_template_helper(UserHelper)

  def match_ready(user)
    @user = user

    mail to: user.email, subject: "[Secret Santa] A tua carta está pronta!"
  end

  def match_redeemed(user, receiver)
    @user = user
    @receiver = receiver

    mail to: user.email, subject: "[Secret Santa] A tua carta está aqui!"
  end
end

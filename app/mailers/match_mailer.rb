class MatchMailer < ApplicationMailer
  def match_redeemed(user, receiver)
    @user = user
    @receiver = receiver

    mail to: user.email, subject: "[Secret Santa] A tua carta está aqui!"
  end
end

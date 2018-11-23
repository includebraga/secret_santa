class MatchMailer < ApplicationMailer
  add_template_helper(ReceiverHelper)
  add_template_helper(UserHelper)

  def match_redeemed(match)
    @user = match.user
    @receiver = match.receiver
    @match = match

    mail to: @user.email, subject: "[Secret Santa] A tua carta está aqui!"
  end
end

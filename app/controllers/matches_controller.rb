class MatchesController < ApplicationController
  def new
    @url = match_path(params[:token])
  end

  def create
    @user = User.find_by(redeem_token: params[:token])

    if @user
      redeem_match
    else
      not_found
    end
  end

  private

  def redeem_match
    match_redeem = MatchRedeem.new(@user)
    match_redeem.perform

    @receiver = match_redeem.receiver
  end
end

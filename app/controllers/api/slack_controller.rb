class API::SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_slack_authenticity

  def callback
    router = Slack::MessageRouter.new(slack_params)

    router.perform

    render json: { text: router.reply }
  end

  private

  def slack_params
    {
      text: params["text"]
    }
  end

  def ensure_slack_authenticity
    head :unauthorized unless params[:token] == ENV["SLACK_TOKEN"]
  end
end

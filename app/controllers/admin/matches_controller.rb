module Admin
  class MatchesController < Admin::ApplicationController
    def received
      match = Match.find(params[:match_id])
      match.update(received: true)

      flash[:notice] = "Match marked as received!"

      redirect_to admin_matches_path
    end
  end
end

module Admin
  class UnreceivedMatchesController < Admin::ApplicationController
    def received
      unreiceved_match = UnreceivedMatch.find(params[:unreceived_match_id])
      unreiceved_match.update(received: true)

      flash[:notice] = "Match marked as received!"

      redirect_to admin_unreceived_matches_path
    end
  end
end

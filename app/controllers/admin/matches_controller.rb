module Admin
  class MatchesController < Admin::ApplicationController
    def create
      match_assigment = MatchAssignment.new(find_user)
      match_assigment.perform

      if match_assigment.successful?
        flash[:notice] = "Match created!"
        redirect_to admin_match_path(match_assigment.match)
      else
        flash[:error] = "Something went wrong."
        redirect_to admin_matches_path
      end
    end

    def received
      match = Match.find(params[:match_id])
      match.update(received: true)

      flash[:notice] = "Match marked as received!"

      redirect_to admin_matches_path
    end

    private

    def find_user
      User.find(match_params[:user_id])
    end

    def find_match
      Match.find(match_params[:match_id])
    end

    def match_params
      params.require(:match).permit(:user_id, :match_id)
    end
  end
end

require "rails_helper"

RSpec.describe MatchesController, type: :controller do
  describe "GET #new" do
    context "for an existing token" do
      it "generates the create url" do
        user = create(:user_with_redeem_token)

        get :new, params: { token: user.redeem_token }

        expect(assigns[:url]).to eq(match_path(user.redeem_token))
      end
    end

    context "for a non-existent token" do
      it "404s" do
        get :new, params: { token: "badjerous" }

        expect(response.status).to eq(404)
      end
    end
  end
  describe "POST #create" do
    context "for users with no matches" do
      it "creates a new match" do
        create(:receiver)
        user = create(:user_with_redeem_token)

        expect do
          post :create, params: { token: user.redeem_token }
        end.to change { Match.count }.by(1)
      end

      it "assigns the correct receiver" do
        create(:receiver)
        user = create(:user_with_redeem_token)

        post :create, params: { token: user.redeem_token }

        match = Match.find_by(user_id: user.id)
        expect(assigns[:receiver]).to eq(match.receiver)
      end
    end

    context "for users with a match" do
      it "doesn't create a match" do
        user = create(:user_with_redeem_token)
        receiver = create(:receiver)
        create(:match, user: user, receiver: receiver)

        expect do
          post :create, params: { token: user.redeem_token }
        end.not_to change { Match.count }
      end

      it "assigns the user's receiver" do
        user = create(:user_with_redeem_token)
        receiver = create(:receiver)
        create(:match, user: user, receiver: receiver)

        post :create, params: { token: user.redeem_token }

        expect(assigns[:receiver]).to eq(receiver)
      end
    end

    context "when the token does not exist" do
      it "404s" do
        post :create, params: { token: "badjerous" }

        expect(response.status).to eq(404)
      end
    end
  end
end

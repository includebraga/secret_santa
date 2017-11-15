require "rails_helper"

RSpec.describe Users::ConfirmationsController, type: :controller do
  describe "GET #create" do
    context "with a valid token" do
      it "confirms the user" do
        user = create(:user, confirmed_at: nil)

        get :create, params: { token: user.confirmation_token }

        expect(user.reload).to be_confirmed
      end

      it "renders the correct template" do
        user = create(:user, confirmed_at: nil)

        get :create, params: { token: user.confirmation_token }

        expect(response).to render_template("create")
      end

      it "404s if the token has already been used" do
        user = create(:user, confirmed_at: nil)
        get :create, params: { token: user.confirmation_token }

        get :create, params: { token: user.confirmation_token }

        expect(response.status).to eq(404)
      end
    end

    context "with an invalid token" do
      it "404s" do
        create(:user, confirmed_at: nil)

        get :create, params: { token: "fake token" }

        expect(response.status).to eq(404)
      end
    end
  end
end

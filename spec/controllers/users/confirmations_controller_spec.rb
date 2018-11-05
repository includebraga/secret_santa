require "rails_helper"

RSpec.describe Users::ConfirmationsController, type: :controller do
  before(:each) { Settings.put(Settings::REGISTRATIONS_ENABLED, true) }

  describe "GET #create" do
    context "with a valid token" do
      it "confirms the user" do
        create(:receiver)
        user = create(:user_with_confirmation_token)

        get :create, params: { token: user.confirmation_token }

        expect(user.reload).to be_confirmed
      end

      it "renders the template" do
        create(:receiver)
        user = create(:user_with_confirmation_token)

        get :create, params: { token: user.confirmation_token }

        expect(response).to render_template("create")
      end

      it "404s if the token has already been used" do
        user = create(:user_with_confirmation_token)
        get :create, params: { token: user.confirmation_token }

        get :create, params: { token: user.confirmation_token }

        expect(response.status).to eq(404)
      end
    end

    context "with a valid token without receivers" do
      it "confirms the user" do
        user = create(:user_with_confirmation_token)

        get :create, params: { token: user.confirmation_token }

        expect(User.find_by_id(id: user.id)).not_to be
      end

      it "renders the template with the 'with_letter' partial" do
        user = create(:user_with_confirmation_token)

        get :create, params: { token: user.confirmation_token }

        expect(response).to render_template("user_deleted")
      end
    end

    context "with an invalid token" do
      it "404s" do
        create(:user_with_confirmation_token)

        get :create, params: { token: "fake token" }

        expect(response.status).to eq(404)
      end
    end
  end
end

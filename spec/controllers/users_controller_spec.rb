require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new user" do
        params = attributes_for(:user, confirmed_at: nil)

        expect do
          post :create, params: { user: params }
        end.to change { User.count }.by(1)
      end

      it "only creates unconfirmed users" do
        params = attributes_for(:user)

        post :create, params: { user: params }

        user = User.find_by(email: params[:email])
        expect(user.confirmed_at).not_to be
      end

      it "renders the confirmation page" do
        params = attributes_for(:user)

        response = post :create, params: { user: params }

        expect(response).to render_template("create")
      end

      it "does not assign any session variables" do
        params = attributes_for(:user)

        post :create, params: { user: params }

        expect(session[:user]).not_to be
      end
    end

    context "with invalid params" do
      it "does not create a new user" do
        params = attributes_for(:user, email: nil)

        expect do
          post :create, params: { user: params }
        end.not_to change { User.count }
      end

      it "does not allow repeated users" do
        user = create(:user)
        params = attributes_for(:user, email: user.email)

        expect do
          post :create, params: { user: params }
        end.not_to change { User.count }
      end

      it "redirects to the sign up page" do
        params = attributes_for(:user, email: nil)

        response = post :create, params: { user: params }

        expect(response).to redirect_to(root_path)
      end

      it "correctly assigns the session variables" do
        params = attributes_for(:user, email: nil)

        post :create, params: { user: params }

        expect(session[:user]).to be
      end
    end
  end
end

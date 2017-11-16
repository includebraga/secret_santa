require "rails_helper"

RSpec.describe UserCreation, type: :model do
  describe "#perform" do
    context "with valid params" do
      it "is successful" do
        user_params = attributes_for(:user_with_confirmation_token)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(user_creation).to be_successful
      end

      it "creates a new user" do
        user_params = attributes_for(:user_with_confirmation_token)
        user_creation = UserCreation.new(user_params)

        expect do
          user_creation.perform
        end.to change { User.count }.by(1)
      end

      it "assigns a confirmation token to the created user" do
        user_params = attributes_for(:user_with_confirmation_token)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        user = User.find_by(email: user_params[:email])
        expect(user.confirmation_token).to be
      end

      it "emails the newly created user" do
        email = double("email", deliver_now: true)
        allow(UserMailer).to receive(:new_user).and_return(email)
        user_params = attributes_for(:user_with_confirmation_token)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(email).to have_received(:deliver_now)
      end
    end

    context "with invalid params" do
      it "is not successful" do
        user_params = attributes_for(:user_with_confirmation_token, email: nil)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(user_creation).not_to be_successful
      end

      it "does not create a new user" do
        user_params = attributes_for(:user_with_confirmation_token, email: nil)
        user_creation = UserCreation.new(user_params)

        expect do
          user_creation.perform
        end.not_to change { User.count }
      end

      it "does not send any emails" do
        email = double("email", deliver_now: true)
        allow(UserMailer).to receive(:new_user).and_return(email)
        user_params = attributes_for(:user_with_confirmation_token, email: nil)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(email).not_to have_received(:deliver_now)
      end
    end
  end

  describe "#successful?" do
    context "with valid params" do
      it "is true" do
        user_params = attributes_for(:user_with_confirmation_token)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(user_creation.successful?).to be
      end
    end

    context "with invalid params" do
      it "is false" do
        user_params = attributes_for(:user_with_confirmation_token, email: nil)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(user_creation.successful?).not_to be
      end
    end
  end

  describe "#user" do
    context "with valid params" do
      it "returns the newly created user" do
        user_params = attributes_for(:user_with_confirmation_token)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        user = User.find_by(email: user_params[:email])
        expect(user_creation.user).to eq(user)
      end
    end

    context "with invalid params" do
      it "returns nil" do
        user_params = attributes_for(:user_with_confirmation_token, email: nil)
        user_creation = UserCreation.new(user_params)

        user_creation.perform

        expect(user_creation.user).to be_nil
      end
    end
  end
end

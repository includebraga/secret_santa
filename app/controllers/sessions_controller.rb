class SessionsController < ActionController::Base
  def new; end

  def create
    admin = authenticate_with_google

    if admin.persisted?
      session[:uuid] = admin.uuid
      redirect_to admin_root_url
    else
      Slack::MessageDelivery.new("Attempted access to admin panel by: #{admin.email}").perform
      redirect_to new_session_url, alert: "you can't do that mate. i'm telling."
    end
  end

  def destroy
    reset_session if current_user

    redirect_to root_url
  end

  private

  def authenticate_with_google
    return unless flash[:google_sign_in_token].present?

    google_sign_in = GoogleSignIn::Identity.new(flash[:google_sign_in_token])

    find_or_invalidate(google_sign_in)
  end

  def find_or_invalidate(google_sign_in)
    organizer = Organizer.find_by(email: google_sign_in.email_address)

    return invalid_organizer(google_sign_in.email_address) unless organizer

    generate_uuid(organizer) unless organizer.previously_signed_in?
    organizer.reload
  end

  def invalid_organizer(email)
    Organizer.new(email: email)
  end

  def generate_uuid(organizer)
    organizer.update(uuid: SecureRandom.uuid)
  end

  def current_user
    return unless session[:uuid]

    Organizer.find_by(uuid: session[:uuid])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?

  private

  def login_user!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def logout_current_user!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

end

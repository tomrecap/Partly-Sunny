class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?, :current_user_can_delete?,
    :convert_to_celsius, :convert_to_fahrenheit

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

  def require_not_signed_in!
    redirect_to zip_codes_url if signed_in?
  end

  def prevent_users_from_modifying_others
    redirect_to zip_codes_url unless params[:id].to_i == current_user.id
  end

  def current_user_can_delete?(comment)
    current_user == (comment.author || comment.photo.submitter)
  end

  def convert_to_celsius(fahrenheit)
    ((fahrenheit - 32) * 5 / 9.0).round(1)
  end

  def convert_to_fahrenheit(celsius)
    ((celsius * 1.8) + 32).round(1)
  end

end

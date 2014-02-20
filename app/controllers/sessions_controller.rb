class SessionsController < ApplicationController
  before_filter :require_not_signed_in!, except: :destroy

  def new

  end

  def create
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password],
    )
    # fail
    if @user
      login_user!(@user)
      redirect_to cities_url
    else
      flash.now[:errors] = "User name and password do not match"
      render :new
    end
  end

  def destroy
    logout_current_user!

    redirect_to root_url
  end


end

class SessionsController < ApplicationController
  before_filter :require_not_signed_in!, except: :destroy

  def new
    @cities = City.all
  end

  def create
    if request.env['omniauth.auth']
      fail
    else
      @user = User.find_by_credentials(
        params[:user][:user_name],
        params[:user][:password],
      )
    end

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

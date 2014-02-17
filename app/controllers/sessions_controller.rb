class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password],
    )

    if user
      login_user!(user)
      redirect_to new_weather_report_url
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def destroy

  end


end

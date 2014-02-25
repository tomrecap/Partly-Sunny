class SessionsController < ApplicationController
  before_filter :require_not_signed_in!, except: :destroy

  def new
    # @zip_codes = ZipCode.all
  end

  def create
    if request.env['omniauth.auth']
      twitter_info = request.env['omniauth.auth']
      @user = User.find_by_uid(twitter_info[:uid])

      unless @user
        @user = User.create!(
          uid: twitter_info[:uid],
          user_name: twitter_info[:info][:nickname],
          bio: twitter_info[:info][:description],
          avatar: twitter_info[:info][:image]
        )
      end
    else
      @user = User.find_by_credentials(
        params[:user][:user_name],
        params[:user][:password],
      )
    end

    if @user
      login_user!(@user)
      redirect_to zip_codes_url
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

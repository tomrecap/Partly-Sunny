class UsersController < ApplicationController

  def new
    prepare_new_instance_variables
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login_user!(@user)
      # UPDATE THE REDIRECT URL AT SOME POINT
      redirect_to new_weather_report_url
    else
      flash.now[:errors] = @user.errors.full_messages

      prepare_new_instance_variables
      render :new
    end
  end

  def activate

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def prepare_new_instance_variables
    @cities = City.all
  end
end

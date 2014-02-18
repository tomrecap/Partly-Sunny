class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    prepare_details_form_instance_variables
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login_user!(@user)
      # UPDATE THE REDIRECT URL AT SOME POINT
      redirect_to new_weather_report_url
    else
      flash.now[:errors] = @user.errors.full_messages

      prepare_details_form_instance_variables
      render :new
    end
  end

  def activate

  end

  def show

  end

  def edit
    @user = User.find(params[:id])

    prepare_details_form_instance_variables
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash.now[:notice] = "Your information has been updated."

      prepare_details_form_instance_variables
      render :edit
    else
      flash.now[:errors] = @user.errors.full_messages

      prepare_details_form_instance_variables
      render :edit
    end
  end

  def destroy

  end

  private
  def prepare_details_form_instance_variables
    @cities = City.all
  end
end

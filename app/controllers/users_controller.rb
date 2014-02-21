class UsersController < ApplicationController
  before_filter :require_signed_in!, except: [:new, :create]
  before_filter :ignore_blank_password_entries, only: [:create, :update]
  before_filter :prevent_users_from_modifying_others,
    only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def dashboard
    starting_photo = params[:offset] || 0

    @cities = City.all
    @weather_conditions = WeatherCondition.all

    favorite_cities = current_user.favorite_cities
    @favorite_cities_without_home = favorite_cities.reject do |city|
      city.id == current_user.home_city_id
    end

    @photos = Photo
      .where(
        "(photos.submitter_id IN (?)) OR (photos.city_id IN (?))",
        current_user.favorited_user_ids,
        current_user.favorite_city_ids
      ).includes(:comments, :tags).limit(10).offset(starting_photo)
  end

  def new
    prepare_details_form_instance_variables
  end

  def create
    @user = User.new(params[:user])
    unless @user.favorite_city_ids.include?(@user.home_city_id)
      @user.favorite_city_ids = @user.favorite_city_ids.push(@user.home_city_id)
    end

    if @user.save
      login_user!(@user)
      redirect_to cities_url
    else
      flash.now[:errors] = @user.errors.full_messages

      prepare_details_form_instance_variables
      render :new
    end
  end

  def activate

  end

  def show
    @user = User.includes(:favorite_cities, :favorited_users).find(params[:id])
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
    User.destroy(params[:id])

    flash[:notice] = "Account removed"
    redirect_to new_session_url
  end

  private
  def prepare_details_form_instance_variables
    @cities = City.all
    @other_users = User.where("id <> ?", current_user.id) if signed_in?
  end

  def ignore_blank_password_entries
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
  end
end

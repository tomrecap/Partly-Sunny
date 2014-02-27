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

    # # @zip_codes = ZipCode.all
    @weather_conditions = WeatherCondition.all

    favorite_zip_codes = current_user.favorite_zip_codes
    @favorite_zip_codes_without_home = favorite_zip_codes.reject do |zip_code|
      zip_code.id == current_user.home_zip_code_id
    end

    @photos = Photo
      .where(
        "(photos.submitter_id IN (?)) OR (photos.zip_code_id IN (?))",
        current_user.favorited_user_ids,
        current_user.favorite_zip_code_ids
      ).includes(:comments, :tags)
      .page(params[:page])
      .per(10)
      .order("created_at DESC")
  end

  def new
    prepare_details_form_instance_variables

  end

  def create
    unless params[:home_zip_code_code_for_user].empty?
      params[:user][:home_zip_code_id] = ZipCode.find_by_zip_code(
        params[:home_zip_code_code_for_user]
      ).id
    end

    @user = User.new(params[:user])
    @user.celsius = (params[:temperature_scale] == "celsius")

    unless @user.favorite_zip_code_ids.include?(@user.home_zip_code_id)
      @user.favorite_zip_code_ids = @user.favorite_zip_code_ids.push(@user.home_zip_code_id)
    end

    if @user.save
      login_user!(@user)
      redirect_to session[:redirect_url] || zip_codes_url
    else
      flash.now[:errors] = @user.errors.full_messages

      prepare_details_form_instance_variables
      render :new
    end
  end

  def activate

  end

  def show
    @user = User.includes(:favorite_zip_codes, :favorited_users).find(params[:id])
  end

  def edit
    @user = User.includes(:favorited_users).find(params[:id])

    prepare_details_form_instance_variables
  end

  def update
    @user = User.find(params[:id])

    params[:user][:home_zip_code_id] = ZipCode.find_by_zip_code(
      params[:home_zip_code_code_for_user]
    ).id
    @user.celsius = (params[:temperature_scale] == "celsius")

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
    # # @zip_codes = ZipCode.all
    @other_users = User.where("id <> ?", current_user.id) if signed_in?
  end

  def ignore_blank_password_entries
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
  end
end

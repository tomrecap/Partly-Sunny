class PhotosController < ApplicationController
  before_filter :require_signed_in!

  def new
    prepare_instance_variables_for_details_form
  end

  def create
    params[:photo][:zip_code_id] = ZipCode.find_by_zip_code(
      params[:zip_code_code_for_photo]
    ).id

    @photo = current_user.photos.new(params[:photo])
    @photo.tag_ids = convert_tag_string_to_tags_array(params[:tags])

    if @photo.save
      flash[:notice] = "Photo added successfully"

      redirect_to photo_url(@photo)
    else
      flash.now[:errors] = @photo.errors.full_messages

      prepare_instance_variables_for_details_form
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    # @zip_codes = ZipCode.all
    @weather_conditions = WeatherCondition.all
  end

  def edit
    @photo = Photo.find(params[:id])
    prepare_instance_variables_for_details_form
  end

  def update
    params[:photo][:zip_code_id] = ZipCode.find_by_zip_code(
      params[:zip_code_code_for_photo]
    ).id

    @photo = Photo.find(params[:id])
    @photo.tag_ids = convert_tag_string_to_tags_array(params[:tags])

    if @photo.update_attributes(params[:photo])
      flash.now[:notice] = "Your photo has been updated."
      redirect_to photo_url(@photo)
    else
      flash.now[:errors] = @photo.errors.full_messages

      prepare_instance_variables_for_details_form
      render :edit
    end
  end

  def destroy
    Photo.destroy(params[:id])

    flash[:notice] = "Photo removed"
    redirect_to user_gallery_url(current_user)
  end

  private
  def prepare_instance_variables_for_details_form
    # @zip_codes = ZipCode.all
    @tags = Tag.all
  end
end

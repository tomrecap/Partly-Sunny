class PhotosController < ApplicationController

  def new
    prepare_instance_variables_for_details_form
  end

  def create
    @photo = current_user.photos.new(params[:photo])

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
  end

  def edit
    @photo = Photo.find(params[:id])
    prepare_instance_variables_for_details_form
  end

  def update
    @photo = Photo.find(params[:id])

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
    redirect_to user_url(current_user)
  end

  private
  def prepare_instance_variables_for_details_form
    @cities = City.all
  end
end

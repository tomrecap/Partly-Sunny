class PhotosController < ApplicationController

  def new

  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      # WHAT GOES HERE?
    else
      flash.now[:errors] = @photo.errors.full_messages

      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      flash.now[:notice] = "Your photo has been updated."
      # WHAT GOES HERE
    else
      flash.now[:errors] = @photo.errors.full_messages

      render :edit
    end
  end

  def delete
    Photo.destroy(params[:id])

    flash[:notice] = "Photo removed"
    redirect_to #WHERE?
  end


end

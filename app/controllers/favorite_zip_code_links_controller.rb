class FavoriteZipCodeLinksController < ApplicationController
  before_filter :require_signed_in!

  def create
    @favorite_zip_code_link = current_user.favorite_zip_code_links.new
    @favorite_zip_code_link.zip_code_id = params[:favorite_zip_code_link][:zip_code_id]

    if @favorite_zip_code_link.save
      redirect_to zip_code_url(@favorite_zip_code_link.zip_code_id)
    else
      flash[:errors] = @favorite_zip_code_link.errors.full_messages

      redirect_to :back
    end
  end

  def destroy
    @favorite_zip_code_link = FavoriteZipCodeLink.find(params[:id])

    if @favorite_zip_code_link.user_id == current_user.id
      @favorite_zip_code_link.destroy

      flash[:notice] = "Favorite removed"
      redirect_to :back
    else
      flash[:notice] = "Cannot modify another user's favorite"
      redirect_to :back
    end
  end

end

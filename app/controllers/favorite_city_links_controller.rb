class FavoriteCityLinksController < ApplicationController

  def create
    @favorite_city_link = FavoriteCityLink.new(params[:favorite_city_link])
    @favorite_city_link.user_id = current_user.id

    if @favorite_city_link.save
      redirect_to city_url(@favorite_city_link.city_id)
    else
      flash[:errors] = @favorite_city_link.errors.full_messages

      redirect_to :back
    end
  end

  def destroy
    FavoriteCityLink.destroy(params[:id])

    flash[:notice] = "Favorite removed"
    redirect_to :back
  end


end

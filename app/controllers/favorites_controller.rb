class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(fishing_id: params[:fishing_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @fishing = Fishing.find(params[:fishing_id])
    @favorite = current_user.favorites.find_by(fishing_id: @fishing.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end

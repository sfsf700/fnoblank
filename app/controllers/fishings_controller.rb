class FishingsController < ApplicationController

  def index
    @fishings = Fishing.includes(:user).order('created_at DESC')
  end

  def new
    @fishing = Fishing.new
  end

  def create
    @fishing = Fishing.create(fishing_params)
    if @fishing.save
      redirect_to root_path
    else
      render new
    end
  end

  private

  def fishing_params
    params.require(:fishing).permit(:name, :memo, :day, :size, :count, :field_id, :image).merge(user_id: current_user.id)
  end

end

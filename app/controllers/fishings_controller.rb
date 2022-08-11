class FishingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :new, :destroy]

  def index
    @fishings = Fishing.includes(:user).order('created_at DESC')
  end

  def new
    @fishing = Fishing.new
  end

  def create
    @fishing = Fishing.create(fishing_params)
    if @fishing.save
      redirect_to fishings_path(@fishing)
    else
      render new
    end
  end

  def show
    @fishing = Fishing.find(params[:id])
    @comments = @fishing.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @fishing = Fishing.find(params[:id])
  end

  def update
    @fishing = Fishing.find(params[:id])
    @fishing.update(fishing_params)
    if @fishing.valid?
      redirect_to fishing_path(fishing_params)
    else
      render :edit
    end
  end

  def destroy
    @fishing = Fishing.find(params[:id])
    if @fishing.user_id == current_user.id 
      @fishing.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def fishing_params
    params.require(:fishing).permit(:name, :memo, :day, :size, :count, :field_id, :image).merge(user_id: current_user.id)
  end

end

class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :history_id, :field_id, :fish_name)
  end
end

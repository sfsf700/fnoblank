class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:fishing_id])
    end
  end

  private
  def comment_params
    params.require(:text).permit(:text).merge(user_id: current_user.id, fishing_id: params[:fishing_id])
  end
end

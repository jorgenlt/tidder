class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_param)
    if @comment.save
      redirect_to root_path
      flash.notice = "Comment submitted."
    else
      flash.alert = "Comment was not registered. Try again."
      redirect_to root_path
    end
  end

  private

  def comment_param
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end

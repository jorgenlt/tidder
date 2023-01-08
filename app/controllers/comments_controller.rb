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

  def upvote
    @comment = Comment.find(params[:id])
    if current_user.voted_up_on? @comment
      @comment.unvote_by current_user
    else
      @comment.upvote_by current_user
    end
    # render 'vote.js.erb'
    redirect_to root_path
    flash.notice = "Vote registered."
  end

  def downvote
    @comment = Comment.find(params[:id])
    if current_user.voted_down_on? @comment
      @comment.unvote_by current_user
    else
      @comment.downvote_by current_user
    end
    # render "vote.js.erb"
    redirect_to root_path
    flash.notice = "Vote registered."
  end

  private

  def comment_param
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end

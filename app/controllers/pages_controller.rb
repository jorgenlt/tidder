class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  # before_action :set_post, only: %i[ show edit update destroy ]

  def home
    @posts = Post.all
    # @posts = Post.all.order(cached_votes_score: :desc)
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by current_user
    end
    render "vote.js.erb"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end

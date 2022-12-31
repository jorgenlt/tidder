class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  helper_method :format_time

  def home
    @posts = Post.all.order(cached_votes_score: :desc)
    @comments = Comment.all
  end
end

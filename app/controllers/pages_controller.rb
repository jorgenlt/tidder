class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.all.order(cached_votes_score: :desc)
  end

end

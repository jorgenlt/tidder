class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  # before_action :set_post, only: %i[ show edit update destroy ]

  def home
    @posts = Post.all
    # @posts = Post.all.order(cached_votes_score: :desc)
  end

end

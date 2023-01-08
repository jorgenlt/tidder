Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    member do
      get "upvote", to: "posts#upvote"
      get "downvote", to: "posts#downvote"
    end
    resources :comments, only: [:new, :create, :show]

  end

  resources :comments do
    member do
      get "upvote", to: "comments#upvote"
      get "downvote", to: "comments#downvote"
      # patch "upvote", to: "comments#upvote"
      # patch "downvote", to: "comments#downvote"
    end
  end
end

Rails.application.routes.draw do
  resources :posts do
    member do
      patch "upvote", to: "posts#upvote"
      patch "downvote", to: "posts#downvote"
    end
  end

  devise_for :users
  root to: "pages#home"
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end

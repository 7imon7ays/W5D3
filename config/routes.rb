Redditclone::Application.routes.draw do

  resource :session, only: [:create, :new, :destroy]
  resources :users
  resources :subs
  resources :links, only: [:show, :create, :new] do
    post "upvote"
    post "downvote"
  end
  resources :comments, only: [:create]

end

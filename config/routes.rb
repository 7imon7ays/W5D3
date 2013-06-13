Redditclone::Application.routes.draw do

  resource :session, only: [:create, :new, :destroy]
  resources :users
  resources :subs
  resources :links, only: [:show, :create, :new]
  resources :comments, only: [:create]

end

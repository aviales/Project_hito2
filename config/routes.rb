Rails.application.routes.draw do
  get "tweets/search"

    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    resources :tweets do
      resources :likes
    
    resources :likes
    member do 
      post 'retweet'
      get 'retweet'
    end
  end


  devise_for :users
  root 'tweets#index'
end


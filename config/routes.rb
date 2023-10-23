Rails.application.routes.draw do
  resources :tweets
  resources :hashtags
  root 'hashtags#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :articles
  resources :collections
  resources :categories
  resources :user_categories

  get '/users/login/:username', to: 'users#login'
  get '/user_categories/unsubscribe', to: 'user_categories#destroy'
end

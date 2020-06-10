Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :articles
  resources :collections
  resources :categories
  resources :user_categories
  resources :sources
  resources :user_sources
  resources :topics
  resources :user_topics
  resources :newspapers
  resources :newspaper_sources
  resources :newspaper_topics

  get '/users/login/:username', to: 'users#login'
  get '/user_categories/unsubscribe', to: 'user_categories#destroy'
  get '/get-sources/:category', to: 'sources#source'
  post '/topics/build-newspaper', to: 'topics#build'
end

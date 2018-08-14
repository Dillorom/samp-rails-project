Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :events do
    resources :comments
  end

  namespace :admin do
    resources :events, :comments
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  root "events#index"

end

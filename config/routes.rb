Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :events do
    resources :comments
    resources :rsvps
  end

  namespace :admin do
    resources :events, :comments
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  #get '/auth/facebook/callback' => 'sessions#create'

   get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
 
  root "events#index"

end

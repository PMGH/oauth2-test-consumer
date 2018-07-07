Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/auth/doorkeeper')

  # get '/auth/:provider/callback' => 'application#authentication_callback'
  get '/auth/doorkeeper/callback' => 'application#authentication_callback'
end

Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # redirect root ('localhost:3001/') to '/auth/doorkeeper' - omniauth strategy if no access_token cookie
  root to: redirect('/auth/doorkeeper'), constraints: lambda { |request| !request.cookies['access_token'] } # !cookies[:access_token]

  # get '/auth/:provider/callback' => 'application#authentication_callback'
  get '/auth/doorkeeper/callback' => 'application#authentication_callback'
end

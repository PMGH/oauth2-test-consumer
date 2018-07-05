class ApplicationController < ActionController::Base
  auth = request.env['omniauth.auth']
  render json: auth.to_json
end

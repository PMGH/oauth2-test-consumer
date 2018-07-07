class ApplicationController < ActionController::Base

  def authentication_callback
    auth = request.env['omniauth.auth']
    render json: auth
  end
end

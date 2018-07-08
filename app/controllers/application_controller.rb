require 'jwt'

class ApplicationController < ActionController::Base
  before_action :verify_access_token

  def authentication_callback
    auth = request.env['omniauth.auth']
    set_user(auth)
    render json: auth
  end

  private

  def set_user auth
    user = {
      id: auth['uid'],
      name: auth['info']['name'],
      email: auth['info']['email']
    }
    User.find_or_create_by(user)
    cookies.permanent[:access_token] = auth['credentials']['token']
  end

  def verify_access_token
    token = cookies[:access_token]
    jwt = JWT.decode token, "MY-SECRET", true, { algorithm: 'HS512' } if token
    redirect_to root if !jwt
  end
end

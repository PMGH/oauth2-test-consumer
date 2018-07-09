class ApplicationController < ActionController::Base
  def authentication_callback
    auth = request.env['omniauth.auth']
    if auth
      set_user(auth)
      render json: auth
    else
      redirect_to "http://localhost:3000/users/sign_in"
    end
  end

  private

  def set_user auth
    user = {
      id: auth['uid'],
      name: auth['extra']['raw_info']['name'],
      email: auth['extra']['raw_info']['email']
    }
    User.find_or_create_by(user)
    cookies[:access_token] = auth['credentials']['token']
  end
end

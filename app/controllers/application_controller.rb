class ApplicationController < ActionController::Base
  def authentication_callback
    auth = request.env['omniauth.auth']
    if auth
      set_user(auth)
      # redirect_to users_path
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
    cookies[:access_token] = { value: auth['credentials']['token'], :httponly => true, :expires => 10.minutes.from_now }
  end
end

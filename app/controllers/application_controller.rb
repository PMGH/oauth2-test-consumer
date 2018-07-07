class ApplicationController < ActionController::Base
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
  end
end

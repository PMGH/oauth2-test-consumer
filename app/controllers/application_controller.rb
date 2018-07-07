class ApplicationController < ActionController::Base
  # auth = request.env['omniauth.auth']
  # render json: auth.to_json

  def authentication_callback
    binding.pry
  end
end

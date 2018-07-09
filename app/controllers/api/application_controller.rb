class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :verify_bearer_token

  private

  def verify_bearer_token
    token = request.headers['Authorization'].split(' ')[1] if request.headers['Authorization']
    jwt = JWT.decode token, ENV['SECRET'], true, { algorithm: ENV['ALGORITHM'] } if token
    # render error if no access_token given or the access_token (jwt) decode fails
    # e.g. wrong hashing algorithm - identifing it as not from the Provider application
    render json: { error: 'no bearer token' } if !token || !jwt
  end
end

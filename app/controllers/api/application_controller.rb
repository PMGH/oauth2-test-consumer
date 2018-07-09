class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :verify_bearer_token

  private

  def verify_bearer_token
    render json: { error: 'no bearer token'} if request.headers['Authorization'] == nil
  end
end

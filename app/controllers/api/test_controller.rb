class Api::TestController < Api::ApplicationController
  def index
    render json: { value: "json!" }
  end
  def create
  end
end

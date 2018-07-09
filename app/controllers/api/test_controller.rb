class Api::TestController < Api::ApplicationController
  def index
    render json: { value: "json!" }
  end
end

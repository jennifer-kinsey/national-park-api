class ParksController < ApplicationController

  def index
    @parks = {"park": "awesome national park"}
    json_response(@parks)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end
end

class Api::V1::WatsonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    render json: Document.as_json(request.body.string)
  end
end

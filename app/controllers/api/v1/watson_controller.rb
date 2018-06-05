class Api::V1::WatsonController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user

  def create
    render json: make_doc(request.body.string).as_json
  end

  private

  def service_call(input_string)
    WatsonService.new(input_string).analysis_service
  end

  def make_doc(input_string)
    Document.new(service_call(input_string))
  end
end

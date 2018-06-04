class Api::V1::WatsonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    body = request.body.string
    document_tone = WatsonService.new(body).analysis_service
    document = Document.new(document_tone)
    render json: document.as_json
  end
end

class Document
  attr_reader :tones
  def initialize(attrs)
    @attrs = attrs
    @tones = make_tones
  end

  def make_tones
    @attrs[:document_tone][:tones].map do |tone|
      { tone_name: tone[:tone_name] }
    end
  end

  def as_json
    {
      tones: @tones
    }
  end
end

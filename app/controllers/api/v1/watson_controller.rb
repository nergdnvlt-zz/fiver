class Api::V1::WatsonController < ApplicationController
  def show
    document_tone = WatsonService.new(params[:text]).analysis_service
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
      tone[:tone_name]
    end
  end

  def as_json
    {
      tones: @tones
    }
  end
end

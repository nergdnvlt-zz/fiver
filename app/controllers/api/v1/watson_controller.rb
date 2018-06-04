class Api::V1::WatsonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    document_tone = WatsonService.new(request.body.string).analysis_service
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

  # def make_tones
  #   @attrs[:document_tone][:tones].map do |tone|
  #     db_tone = Tone.find_by(tone_name: tone[:tone_name])
  #     { tone_name: db_tone.tone_name, tone_url: db_tone.url }
  #   end
  # end

  def as_json
    {
      tones: @tones
    }
  end
end

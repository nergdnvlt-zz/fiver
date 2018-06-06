class Document
  attr_reader :tones

  def self.as_json(input_string)
    new(input_string).as_json
  end

  def as_json
    {
      tones: @tones
    }
  end

  private

  def initialize(input_string)
    @input_string = input_string
    @tones = make_tones
  end

  def make_tones
    service_call[:document_tone][:tones].map do |tone|
      { tone_name: tone[:tone_name] }
    end
  end

  def service_call
    WatsonService.new(@input_string).analysis_service
  end
end

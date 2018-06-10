class ToneRanker
  def self.as_json(crypto_id)
    new(crypto_id).as_json
  end

  def as_json
    {
      tones: @tones
    }
  end

  private

  def initialize(crypto_id)
    @crypto_id = crypto_id
    @tones = tones
  end

  def get_tones
    Crypto.find(@crypto_id)
          .tweets
          .group("tone")
          .order("count_tone_id desc")
          .count("tone_id")
  end

  def tones
    get_tones.keys[0..1].map do |tone|
      { tone_name: tone.tone_name }
    end
  end
end

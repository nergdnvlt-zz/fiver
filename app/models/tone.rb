class Tone
  attr_reader :score, :id, :name

  def initialize(result)
    @score = result[:score]
    @id = result[:tone_id]
    @name = result[:tone_name]
  end
end

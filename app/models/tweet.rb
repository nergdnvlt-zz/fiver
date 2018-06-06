class Tweet < ApplicationRecord
  validates_presence_of :text
  before_save :save_text

  has_many :tweet_tones, dependent: :destroy
  has_many :tones, through: :tweet_tones

  def parse_text
    words = self.text.split
    words.map do |word|
      word if word.exclude?('http')
    end.compact.join(' ')
  end

  def save_text
    self.text = parse_text
  end
end

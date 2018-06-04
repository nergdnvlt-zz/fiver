class Tweet < ApplicationRecord
  validates_presence_of :text
  before_save :save_text

  has_many :tweet_tones, dependent: :destroy
  has_many :tones, through: :tweet_tones

  def parse_text
    words = self.text.split
    words.each do |word|
      word.gsub!('http', ' ') if word.include?('http')
      word.gsub!('https', ' ') if word.include?('https')
    end.join(' ')
  end

  def save_text
    self.text = parse_text
  end
end

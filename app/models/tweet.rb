class Tweet < ApplicationRecord
  validates_presence_of :text
  before_save :save_text

  belongs_to :tone
  belongs_to :crypto

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

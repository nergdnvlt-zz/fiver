class Tweet < ApplicationRecord
  validates_presence_of :text
  before_save :save_text

  belongs_to :tone
  belongs_to :crypto

  private

  def parse_text
    split_text.delete_if { |word| word.include?('http') }.join(' ')
  end

  def split_text
    text.split
  end

  def save_text
    self.text = parse_text
  end
end

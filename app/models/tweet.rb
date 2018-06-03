class Tweet < ApplicationRecord
  validates_presence_of :text, :score, :tone_id, :tone_name

  has_many :tweet_tones
  has_many :tones, through: :tweet_tones
end

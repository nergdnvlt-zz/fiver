class Tone < ApplicationRecord
  validates_presence_of :tone_name, :url
  has_many :tweet_tones
  has_many :tweets, through: :tweet_tones
end

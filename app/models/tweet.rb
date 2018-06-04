class Tweet < ApplicationRecord
  validates_presence_of :text

  has_many :tweet_tones, dependent: :destroy
  has_many :tones, through: :tweet_tones
end

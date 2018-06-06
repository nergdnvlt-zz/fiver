class Tone < ApplicationRecord
  validates_presence_of :tone_name

  has_many :tweets, dependent: :destroy
end

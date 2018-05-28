class Tweet < ApplicationRecord
  validates_presence_of :text, :score, :tone_id, :tone_name
end

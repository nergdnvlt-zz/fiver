class Crypto < ApplicationRecord
  validates_presence_of :name, :symbol
  has_many :tweets, dependent: :destroy
end

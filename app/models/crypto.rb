class Crypto < ApplicationRecord
  validates_presence_of :name, :symbol
end

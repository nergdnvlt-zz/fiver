class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  def to_params
    slug
  end
end

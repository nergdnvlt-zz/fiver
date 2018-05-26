class User < ApplicationRecord
  before_save :generate_slug

  has_secure_password
  validates_presence_of :name
  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  def to_params
    slug
  end

  def generate_slug
    self.slug = username.parameterize
  end

  # def self.from_omniauth(auth_info)
  #   where(email: auth_info.info.email).first_or_create do |new_user|
  #     new_user.name = auth_info.info.name
  #     new_user.id_token = auth_info.extra.id_token
  #     new_user.username = auth_info.info.name.parameterize
  #   end
  # end
end

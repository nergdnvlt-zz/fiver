class NativeUser < User
  has_secure_password

  before_save :generate_slug

  def generate_slug
    self.slug = username.parameterize
  end
end

class GoogleUser < User
  def self.from_omniauth(auth_info)
    where(email: auth_info[:info][:email]).first_or_create do |new_user|
      new_user.name = auth_info[:info][:name]
      new_user.id_token = auth_info[:extra][:id_token]
      new_user.username = auth_info[:info][:name].parameterize
    end
  end
end

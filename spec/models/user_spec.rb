require 'rails_helper'

describe User do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :password }
  end
end

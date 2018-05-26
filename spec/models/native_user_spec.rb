require 'rails_helper'

describe NativeUser do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  describe 'Uniqueness' do
    it 'test for username' do
      create(:native_user, username: 'fluffy')
      user2 = NativeUser.new(name: 'fluffy', username: 'fluffy', email: 'fluffy@fluffy.com', password: 'test')

      expect(user2).to be_invalid
    end

    it 'test for email' do
      create(:native_user, email: 'fluffy@fluffy.com')
      user2 = NativeUser.new(name: 'fluffy', username: 'fluffy', email: 'fluffy@fluffy.com', password: 'test')

      expect(user2).to be_invalid
    end
  end

  describe 'sets slug properly' do
    it 'sets the slug from username' do
      user = create(:native_user)

      expect(user.slug).to eq(user.username.parameterize)
    end
  end
end

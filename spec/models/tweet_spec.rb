require 'rails_helper'

describe Tweet do
  describe 'validations' do
    it { should validate_presence_of :text }
  end

  describe 'relationships' do
    it { should have_many :tweet_tones }
    it { should have_many :tones }
  end
end

require 'rails_helper'

describe Tone do
  describe 'validations' do
    it { should validate_presence_of :tone_name }
    it { should validate_presence_of :url }
  end

  describe 'relationships' do
    it { should have_many :tweet_tones }
    it { should have_many :tweets }
  end
end

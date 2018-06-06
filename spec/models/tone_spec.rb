require 'rails_helper'

describe Tone do
  describe 'validations' do
    it { should validate_presence_of :tone_name }
  end

  describe 'relationships' do
    it { should have_many :tweets }
  end
end

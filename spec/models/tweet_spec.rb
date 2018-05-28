require 'rails_helper'

describe Tweet do
  describe 'validations' do
    it { should validate_presence_of :text }
    it { should validate_presence_of :score }
    it { should validate_presence_of :tone_id }
    it { should validate_presence_of :tone_name }
  end
end

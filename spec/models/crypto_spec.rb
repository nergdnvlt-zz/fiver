require 'rails_helper'

describe Crypto do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :symbol }
  end
end

require 'rails_helper'

describe GoogleUser do
  context 'initialize' do
    let(:attributes) do
      { info: {
        name: 'Thor Odinson',
        email: 'fatherwar@test.io'
      }, extra: {
        id_token: '1234567890'
      } }
    end

    it 'exists with valid attributes' do
      subject = GoogleUser.from_omniauth(attributes)

      expect(subject.name).to eq('Thor Odinson')
      expect(subject.id_token).to eq('1234567890')
      expect(subject.username).to eq('thor-odinson')
    end
  end
end

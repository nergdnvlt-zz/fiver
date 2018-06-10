require 'rails_helper'

describe ToneRanker do
  before(:each) do
    tone = Tone.create!(tone_name: 'Anger')
    @crypto = Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
    @crypto.tweets.create!(text: 'bitcoin ftw', tone: tone)
    @crypto.tweets.create!(text: 'yay', tone: tone)
    @crypto.tweets.create!(text: 'wonderbread', tone: tone)
    @crypto.tweets.create!(text: 'winning', tone: tone)
    @crypto.tweets.create!(text: 'losing', tone: tone)
    @crypto.tweets.create!(text: 'tired', tone: tone)
    @crypto.tweets.create!(text: 'appalachian', tone: tone)
    @crypto.tweets.create!(text: 'thrasher', tone: tone)
    @crypto.tweets.create!(text: 'fluffy', tone: tone)
    @crypto.tweets.create!(text: 'dynamic', tone: tone)
  end

  describe 'class methods' do
    it '#as_json' do
      tones = ToneRanker.as_json(@crypto.id)

      expect(tones).to be_a Hash
      expect(tones.keys).to eq([:tones])
      expect(tones[:tones]).to be_a Array
      expect(tones[:tones][0].keys).to eq([:tone_name])
      expect(tones[:tones][0].values).to eq(['Anger'])
    end
  end

  describe 'instance methods' do
    it 'constructs json' do
      tones = ToneRanker.new(@crypto.id).as_json

      expect(tones).to be_a Hash
      expect(tones.keys).to eq([:tones])
      expect(tones[:tones]).to be_a Array
      expect(tones[:tones][0].keys).to eq([:tone_name])
      expect(tones[:tones][0].values).to eq(['Anger'])
    end
  end
end

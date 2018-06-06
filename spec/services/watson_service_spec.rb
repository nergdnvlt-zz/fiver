require 'rails_helper'

describe WatsonService do
  it 'returns analyzed tweets' do
    VCR.use_cassette('/services/watson_service') do
      raw_tweets = 'This is absolutely amazing!!! This is utterly intoxicating.'
      tweet = WatsonService.new(raw_tweets).analysis_service

      expect(tweet).to be_a Hash
      expect(tweet.keys[0]).to eq(:document_tone)
    end
  end
end

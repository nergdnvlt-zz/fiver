require 'rails_helper'

describe WatsonService do
  it 'returns analyzed tweets' do
    VCR.use_cassette('/services/watson_service') do
      raw_tweets = 'This is absolutely amazing!!! This is utterly intoxicating.'
      tweet = WatsonService.new(raw_tweets).analyzed_tweets
      expect(tweet[0]).to be_a Tweet
      expect(tweet[0].tone_name).to eq('Joy')
    end
  end

  it 'returns an analyzed document' do
    VCR.use_cassette('/services/watson_service') do
      raw_tweets = 'This is absolutely amazing!!! This is utterly intoxicating. What are we gonna do? Oh no. Bob said sally likes peanut butter.'
      document_tone = WatsonService.new(raw_tweets).document_tones

      expect(document_tone.size).to eq(2)
      expect(document_tone[0]).to be_a Tone
      expect(document_tone[0].name).to eq('Joy')
      expect(document_tone[1]).to be_a Tone
      expect(document_tone[1].name).to eq('Confident')
    end
  end
end

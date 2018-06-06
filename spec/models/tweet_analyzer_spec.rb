require 'rails_helper'

describe TweetAnalyzer do
  describe 'class methods' do
    before(:each) do
      Tone.create!(tone_name: 'Anger')
      Tone.create!(tone_name: 'Confident')
      Tone.create!(tone_name: 'Fear')
      Tone.create!(tone_name: 'Joy')
      Tone.create!(tone_name: 'Sadness')
      Tone.create!(tone_name: 'Tentative')
    end

    it 'returns tweets for currency' do
      VCR.use_cassette('/models/tweet_analyzer-BTC') do
        crypto = Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
        tweets = TweetAnalyzer.new(crypto.symbol, crypto.id).tweets

        expect(tweets).to be_a Array
        expect(tweets.count).to eq(10)
        expect(tweets[0]).to be_a Tweet
      end
    end

    it 'returns joined tweet text' do
      VCR.use_cassette('/models/joined_tweet-BTC') do
        crypto = Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
        tweets = TweetAnalyzer.new(crypto.symbol, crypto.id).joined_tweets

        expect(tweets).to be_a String
        expect(tweets).to include('BTC')
      end
    end
  end
end

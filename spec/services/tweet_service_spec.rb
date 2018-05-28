require 'rails_helper'

describe TweetService do
  it 'returns a list of tweets' do
    VCR.use_cassette('/services/tweet_service') do
      crypto = 'Bitcoin'

      @tweets = TweetService.new(crypto).return_tweets
      expect(@tweets.size).to eq(20)
      expect(@tweets[0]).to be_a RawTweet
      expect(@tweets[-1]).to be_a RawTweet
    end
  end
end

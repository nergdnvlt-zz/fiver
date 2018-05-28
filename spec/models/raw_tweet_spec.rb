require 'spec_helper'
require './app/models/raw_tweet'

describe RawTweet do
  it 'initializes with text as attribute' do
    text = 'Best tweet ever'

    tweet = RawTweet.new(text)
    expect(tweet.text).to eq(text)
  end

  it 'initializes with other text as attribute' do
    text = 'Not the best tweet ever'

    tweet = RawTweet.new(text)
    expect(tweet.text).to eq(text)
  end
end

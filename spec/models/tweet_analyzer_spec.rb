# require 'rails_helper'
#
# describe TweetAnalyzer do
#   describe 'class methods' do
#     it 'returns tweets for currency' do
#       VCR.use_cassette('/models/tweet_analyzer-BTC') do
#         tweets = TweetAnalyzer.new('BTC').tweets
#
#         expect(tweets).to be_a Array
#         expect(tweets.count).to eq(10)
#         expect(tweets[0]).to be_a Tweet
#       end
#     end
#
#     it 'returns joined tweet text' do
#       VCR.use_cassette('/models/joined_tweet-BTC') do
#         tweets = TweetAnalyzer.new('BTC').joined_tweets
#
#         expect(tweets).to be_a String
#         expect(tweets).to include('BTC')
#       end
#     end
#   end
# end

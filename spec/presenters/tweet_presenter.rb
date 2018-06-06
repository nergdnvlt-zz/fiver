# require 'rails_helper'
#
# describe TweetPresenter do
#   describe 'instance methods' do
#     it 'returns tweets for currency' do
#       VCR.use_cassette('/presenters/tweet_analyzer-BTC') do
#         tweets = TweetPresenter.new('BTC').tweets
#
#         expect(tweets).to be_a Array
#         expect(tweets.count).to eq(10)
#         expect(tweets[0]).to be_a Tweet
#       end
#     end
#
#     it 'returns tweets for other currency' do
#       VCR.use_cassette('/presenters/tweet_analyzer-ETH') do
#         tweets = TweetPresenter.new('ETH').tweets
#
#         expect(tweets).to be_a Array
#         expect(tweets.count).to eq(10)
#         expect(tweets[0]).to be_a Tweet
#       end
#     end
#
#     it 'returns joined tweet text for BTC' do
#       VCR.use_cassette('/presenters/joined_tweet-BTC') do
#         tweets = TweetPresenter.new('BTC').document_text
#
#         expect(tweets).to be_a String
#         expect(tweets).to include('BTC')
#       end
#     end
#
#     it 'returns joined tweet text for ETH' do
#       VCR.use_cassette('/presenters/joined_tweet-ETH') do
#         tweets = TweetPresenter.new('ETH').document_text
#
#         expect(tweets).to be_a String
#         expect(tweets).to include('ETH')
#       end
#     end
#   end
# end

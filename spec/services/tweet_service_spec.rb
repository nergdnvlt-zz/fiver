# require 'rails_helper'
#
# describe TweetService do
#   it 'returns a list of tweets' do
#     VCR.use_cassette('/services/tweet_service') do
#       crypto = 'Bitcoin'
#
#       @tweets = TweetService.new(crypto).return_tweets
#
#       expect(@tweets).to be_a String
#       expect(@tweets).to include('bitcoin')
#     end
#   end
# end

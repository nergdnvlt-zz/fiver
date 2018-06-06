# require 'rails_helper'
#
# describe TweetService do
#   it 'returns a list of tweets' do
#     VCR.use_cassette('/services/market_service-bitcoin') do
#       crypto = 'BTC'
#
#       @market_data = MarketService.new(crypto).market
#
#       expect(@market_data).to be_a Float
#       expect(@market_data).to eq(1.24)
#     end
#   end
#
#   it 'returns a list of tweets' do
#     VCR.use_cassette('/services/market_service-etherium') do
#       crypto = 'ETH'
#
#       @market_data = MarketService.new(crypto).market
#
#       expect(@market_data).to be_a Float
#       expect(@market_data).to eq(1.92)
#     end
#   end
#
#   it 'returns a list of tweets' do
#     VCR.use_cassette('/services/market_service-XRP') do
#       crypto = 'XRP'
#
#       @market_data = MarketService.new(crypto).market
#
#       expect(@market_data).to be_a Float
#       expect(@market_data).to eq(1.27)
#     end
#   end
#
#   it 'returns a list of tweets' do
#     VCR.use_cassette('/services/market_service-LTC') do
#       crypto = 'LTC'
#
#       @market_data = MarketService.new(crypto).market
#
#       expect(@market_data).to be_a Float
#       expect(@market_data).to eq(0.89)
#     end
#   end
# end

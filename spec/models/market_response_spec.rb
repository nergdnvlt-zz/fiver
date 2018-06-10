require 'rails_helper'

describe MarketService do
  describe 'class methods' do
    it 'returns JSON for the market change' do
      VCR.use_cassette('/models/market_service_class-BTC') do
        market = MarketResponse.as_json('BTC')

        expect(market).to be_a Hash
        expect(market[:market_change]).to eq('+1.43')
      end
    end

    it 'returns different JSON for the market change' do
      VCR.use_cassette('/models/market_service_class_ETH') do
        market = MarketResponse.as_json('ETH')

        expect(market).to be_a Hash
        expect(market[:market_change]).to eq('+1.79')
      end
    end
  end

  describe 'instance methods' do
    it 'returns JSON for the market change' do
      VCR.use_cassette('/models/market_service_instance-BTC') do
        market = MarketResponse.new('BTC')
        market_response = market.as_json

        expect(market_response).to be_a Hash
        expect(market_response[:market_change]).to eq('+1.45')
      end
    end

    it 'returns different JSON for the market change' do
      VCR.use_cassette('/models/market_service_instance_ETH') do
        market = MarketResponse.new('ETH')
        market_response = market.as_json

        expect(market_response).to be_a Hash
        expect(market_response[:market_change]).to eq('+1.73')
      end
    end
  end
end

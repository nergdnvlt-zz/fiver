require 'rails_helper'

describe MarketService do
  it 'returns a market data' do
    VCR.use_cassette('/services/market_service-bitcoin') do
      @market_data = MarketService.request

      expect(@market_data).to be_a Hash
      expect(@market_data[:status]).to eq('success')
      expect(@market_data[:data][:coins][0][:symbol]).to eq('BTC')
      expect(@market_data[:data][:coins][0][:change]).to eq(1.24)
    end
  end

  it 'also returns market data' do
    VCR.use_cassette('/services/market_service-instance-bitcoin') do
      @market_data = MarketService.new.parsed_request

      expect(@market_data).to be_a Hash
      expect(@market_data[:status]).to eq('success')
      expect(@market_data[:data][:coins][0][:symbol]).to eq('BTC')
      expect(@market_data[:data][:coins][0][:change]).to eq(1.38)
    end
  end
end

class Api::V1::MarketController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_symbol

  def create
    render json: market_response.as_json
  end

  private

  def service_call
    MarketService.new(@symbol).market
  end

  def market_response
    MarketResponse.new(service_call)
  end

  def set_symbol
    @symbol = Crypto.find(request.body.string.to_i).symbol
  end
end

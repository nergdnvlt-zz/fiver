class Api::V1::MarketController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_symbol

  def create
    render json: MarketResponse.as_json(@symbol)
  end

  private

  def set_symbol
    @symbol = Crypto.find(request.body.string.to_i).symbol
  end
end

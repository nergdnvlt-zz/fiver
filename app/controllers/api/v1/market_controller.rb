class Api::V1::MarketController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    #need to grab symbol from fetch
    MarketService.new(symbol).parsed_request
  end
end

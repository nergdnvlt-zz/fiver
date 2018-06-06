class MarketResponse
  def self.as_json(symbol)
    new(symbol).as_json
  end

  def as_json
    {
      market_change: service_call
    }
  end

  private

  def initialize(symbol)
    @symbol = symbol
  end

  def service_call
    MarketService.new(@symbol).market
  end

  # def market_response
  #   MarketResponse.new(service_call)
  # end

  # def initialize(change)
  #   @change = change
  # end
  #
  # def as_json
  #   {
  #     market_change: @change
  #   }
  # end
end

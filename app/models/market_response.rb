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
end

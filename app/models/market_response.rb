# Gets the market data from the API call and sends that to the MarketEvaluator
class MarketResponse
  def self.as_json(symbol)
    new(symbol).as_json
  end

  def as_json
    {
      market_change: market
    }
  end

  private

  def initialize(symbol)
    @symbol = symbol
  end

  def service_call
    MarketService.request
  end

  def market
    @market ||= MarketEvaluator.currency_market_change(@symbol, service_call)
  end
end

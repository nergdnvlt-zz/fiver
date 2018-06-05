class MarketService
  def initialize(coin)
    @symbol = coin
  end

  def market
    @market ||= CoinChange.currency_market_change(@symbol, parsed_request)
  end

  def parsed_request
    JSON.parse(interval_request.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://api.coinranking.com/v1/public/coins')
  end

  def interval_request
    conn.get do |req|
      req.params['timePeriod'] = '24h'
    end
  end
end

class CoinChange

  def initialize(currency, parsed_request)
    @currency = currency
    @parsed_request = parsed_request
  end

  def self.currency_market_change(currency, parsed_request)
    new(currency, parsed_request).which_coin
  end

  def which_coin
    return bitcoin_change if bitcoin?
    return etherium_change if etherium?
    return ripple_change if ripple?
    return litecoin_change if litecoin?
  end

  private

  def bitcoin?
    @currency == 'BTC'
  end

  def bitcoin_change
    @parsed_request[:data][:coins][0][:change]
  end

  def etherium?
    @currency == 'ETH'
  end

  def etherium_change
    @parsed_request[:data][:coins][1][:change]
  end

  def ripple?
    @currency == 'XRP'
  end

  def ripple_change
    @parsed_request[:data][:coins][2][:change]
  end

  def litecoin?
    @currency == 'LTC'
  end

  def litecoin_change
    @parsed_request[:data][:coins][5][:change]
  end
end

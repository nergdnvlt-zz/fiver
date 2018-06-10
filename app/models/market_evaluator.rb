# Takes currency sym and market data to find change for that currency
class MarketEvaluator
  def formatted_change
    return "+#{which_coin}" if pos_change?
    which_coin
  end

  def self.currency_market_change(currency, parsed_request)
    new(currency, parsed_request).formatted_change
  end

  private

  def initialize(currency, parsed_request)
    @currency = currency
    @parsed_request = parsed_request
  end

  def pos_change?
    which_coin.to_s.exclude?('-')
  end

  def which_coin
    return bitcoin_change if bitcoin?
    return etherium_change if etherium?
    return ripple_change if ripple?
    return litecoin_change if litecoin?
  end

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

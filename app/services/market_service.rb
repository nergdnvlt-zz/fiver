class MarketService
  def self.request
    new.parsed_request
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

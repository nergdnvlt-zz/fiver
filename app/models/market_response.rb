class MarketResponse

  def initialize(change)
    @change = change
  end

  def as_json
    {
      market_change: @change
    }
  end
end

class TweetPresenter
  attr_reader :tweets, :document_text
  def initialize(crypto_name)
    @crypto_name = crypto_name
    @analyzer ||= TweetAnalyzer.new(@crypto_name)
    @tweets = tweets
  end

  def tweets
    @tweets = @analyzer.tweets
  end

  def document_text
    @document_text = @analyzer.joined_tweets
  end
end

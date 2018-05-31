class AnalyzerPresenter
  attr_reader :raw_tweets, :document_analysis

  def initialize(crypto)
    @raw_tweets ||= TweetService.new(crypto).return_tweets
  end

  def tweets
    @tweets ||= WatsonService.new(join_raw_tweets).analyzed_tweets
  end

  def document_tones
    @document_tones ||= WatsonService.new(join_raw_tweets).document_tones
  end

  private

  def join_raw_tweets
    @raw_tweets.map(&:text).join
  end
end

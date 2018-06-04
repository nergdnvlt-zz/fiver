class AnalyzerPresenter
  attr_reader :raw_tweets, :document_analysis

  def initialize(crypto)
    @raw_tweets ||= TweetService.new(crypto).return_tweets
  end

  def tweets
    @tweets ||= WatsonService.new(@raw_tweets).analyzed_tweets[0..9]
  end

  def joined_tweets
    tweets.map(&:text).join
  end

  # def document_tones
  #   @document_tones ||= WatsonService.new(join_raw_tweets).document_tones
  # end
end

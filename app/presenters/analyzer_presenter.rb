class AnalyzerPresenter
  attr_reader :raw_tweets, :tweets, :document_analysis

  def initialize(crypto)
    @raw_tweets ||= TweetService.new(crypto).return_tweets
  end

  def tweets
    @tweets ||= WatsonService.new(join_raw_tweets).analyzed_tweets
    # @tweets ||= watson_service.analyzed_tweets
  end

  def document_tones
    @document_tones ||= WatsonService.new(join_raw_tweets).document_tones
    # @document_tones ||= watson_service.document_tones
  end

  private

  def join_raw_tweets
    @raw_tweets.map(&:text).join
  end

  def watson_service
    @watson_service ||= WatsonService.new(join_raw_tweets)
  end
end

class TweetAnalyzer
  def tweets
    analyzed_tweets[0..9]
  end

  def joined_tweets
    analyzed_tweets.map(&:text).join
  end

  private

  def tweet_response
    @tweets ||= WatsonService.new(@raw_tweets).analysis_service
  end


  def initialize(crypto)
    @raw_tweets ||= TweetService.new(crypto).return_tweets
  end

  def analyzed_tweets
    tweet_response[:sentences_tone].map do |sentence|
      next if sentence[:tones].empty?
      tone = Tone.find_by(tone_name: sentence[:tones][0][:tone_name])
      tweet = Tweet.create({ text: sentence[:text] })
      tweet.tweet_tones.create(tone: tone)
      tweet
    end.compact
  end
end

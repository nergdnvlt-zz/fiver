class TweetAnalyzer
  def tweets
    analyzed_tweets[0..9]
  end

  def joined_tweets
    analyzed_tweets.map(&:text).join
  end

  def analyzed_tweets
    a = remove_analytical.map do |sentence|
      tone = Tone.find_by(tone_name: sentence[:tones][0][:tone_name])
      Tweet.create({ text: sentence[:text], crypto_id: @crypto_id, tone_id: tone.id })
    end
  end

  private

  def remove_nil
    tweet_response[:sentences_tone].delete_if { |sentence| sentence[:tones].empty? }
  end

  def remove_analytical
    remove_nil.delete_if { |sentence| sentence[:tones][0][:tone_name] == 'Analytical' }
  end

  def tweet_response
    @tweets ||= WatsonService.new(@raw_tweets).analysis_service
  end

  def initialize(crypto, crypto_id)
    @raw_tweets ||= TweetService.new(crypto).return_tweets
    @crypto_id = crypto_id
  end
end

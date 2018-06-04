class WatsonService
  def initialize(raw_tweets)
    @raw_tweets = raw_tweets
  end

  def analyzed_tweets
    tweets = analysis_service[:sentences_tone].map do |sentence|
      next if sentence[:tones].empty?
      next if sentence[:tones][0][:tone_name] == 'Analytical'
      tone = Tone.find_by(tone_name: sentence[:tones][0][:tone_name])
      tweet = Tweet.create({ text: sentence[:text] })
      tweet.tweet_tones.create(tone: tone)
      tweet
    end.compact
  end

  def analysis_service
    @analysis_service ||= JSON.parse(post_to_watson.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: ENV['watson_base_url']) do |req|
      req.basic_auth(ENV['watson_username'], ENV['watson_password'])
      req.request  :url_encoded
      req.response :logger
      req.adapter  :net_http
    end
  end

  def post_to_watson(tweets = @raw_tweets)
    conn.post do |req|
      req.headers['Authorization']
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
      req.body = "#{tweets}"
    end
  end
end

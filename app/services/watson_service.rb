class WatsonService
  def initialize(raw_tweets)
    @raw_tweets = raw_tweets
  end

  def analyzed_tweets
    analysis_service[:sentences_tone].map do |sentence|
      next if sentence[:tones].empty?
      Tweet.create({ text: sentence[:text],
                     score: sentence[:tones][0][:score],
                     tone_id: sentence[:tones][0][:tone_id],
                     tone_name: sentence[:tones][0][:tone_name] })
    end.compact
  end

  def document_tones
    @document_tones = new_document_analysis[:document_tone][:tones].map do |tone|
      Tone.new(tone)
    end
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

  def analysis_service
    @analysis ||= JSON.parse(post_to_watson.body, symbolize_names: true)
  end

  def new_document_analysis
    @new_document_analysis ||= JSON.parse(post_to_watson(analyzed_tweets).body, symbolize_names: true)
  end
end

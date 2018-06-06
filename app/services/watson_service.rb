class WatsonService
  def initialize(raw_tweets)
    @raw_tweets = raw_tweets
  end

  def analysis_service
    JSON.parse(post_to_watson.body, symbolize_names: true)
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

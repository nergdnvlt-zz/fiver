class TweetService
  def initialize(crypto)
    @crypto = crypto
  end

  def return_tweets
    client.search("#{@crypto_name} -rt", result_type: "recent", lang: "en").take(10).map do |api_tweet|
      Tweet.new(api_tweet.text)
    end
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_consumer_key']
      config.consumer_secret = ENV['twitter_consumer_secret']
      config.access_token = ENV['twitter_access_token']
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end
end

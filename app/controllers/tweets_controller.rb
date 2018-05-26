class TweetsController < ApplicationController
  def index
    crypto_name = Crypto.find(params[:crypto_id]).name
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_consumer_key']
      config.consumer_secret = ENV['twitter_consumer_secret']
      config.access_token = ENV['twitter_access_token']
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
    @tweets = client.search("#{crypto_name} -rt", result_type: "recent", lang: "en").take(10)
  end
end

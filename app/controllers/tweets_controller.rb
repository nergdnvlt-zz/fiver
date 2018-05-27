class TweetsController < ApplicationController
  def index
    crypto_name = Crypto.find(params[:crypto_id]).name
    @tweets = TweetService.new(crypto_name).return_tweets
  end
end

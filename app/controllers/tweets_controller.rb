class TweetsController < ApplicationController
  before_action :require_login

  def index
    @tweets = Crypto.find(params[:crypto_id]).tweets.order("RANDOM()").limit(10)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end

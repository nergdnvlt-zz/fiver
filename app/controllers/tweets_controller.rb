class TweetsController < ApplicationController
  before_action :require_login

  def index
    @tweets = TweetPresenter.new(params[:crypto_id])
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end

class TweetsController < ApplicationController
  before_action :set_crypto_name, only: [:index]
  before_action :require_login

  def index
    @tweets = TweetPresenter.new(@crypto)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def set_crypto_name
    @crypto = Crypto.find(params[:crypto_id]).name
  end
end

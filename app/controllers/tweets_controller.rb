class TweetsController < ApplicationController
  def index
    crypto_name = Crypto.find(params[:crypto_id]).name
    @analyzer = AnalyzerPresenter.new(crypto_name)
    @document_text = @analyzer.joined_tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end

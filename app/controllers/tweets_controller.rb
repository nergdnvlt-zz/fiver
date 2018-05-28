class TweetsController < ApplicationController
  def index
    crypto_name = Crypto.find(params[:crypto_id]).name
    @analyzer = AnalyzerPresenter.new(crypto_name)
  end
end

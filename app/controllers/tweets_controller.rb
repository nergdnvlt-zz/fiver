class TweetsController < ApplicationController
  def index
    crypto = Crypto.find(params[:crypto_id])
  end
end

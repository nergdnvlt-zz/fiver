class TweetPresenter
  def initialize(crypto_id)
    @crypto_id = crypto_id
    @tweets = tweets
  end

  def tweets
    @tweets = Crypto.find(@crypto_id).tweets.order("RANDOM()").limit(10)
  end

  # def document_text
  #   @document_text = @tweets.pluck(:text).join
  # end
end

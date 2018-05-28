class TweetsController < ApplicationController
  def index
    crypto_name = Crypto.find(params[:crypto_id]).name
    @analyzer = AnalyzerPresenter.new(crypto_name).analyze_tweets
    # @tweets = TweetService.new(crypto_name).return_tweets
  end
end

class AnalyzerPresenter
  attr_reader :tweets
  def initialize(crypto)
    @tweets ||= TweetService.new(crypto).return_tweets
  end

  def raw_tweets
    @tweets.map(&:text).join
  end

  def analyze_tweets
    WatsonService.new(raw_tweets).analysis
  end
end

class WatsonService
  def initialize(tweets)
    @tweets = tweets
  end

  def conn
    Faraday.new(url: ENV['watson_base_url']) do |req|
      req.basic_auth(ENV['watson_username'], ENV['watson_password'])
      req.request  :url_encoded
      req.response :logger
      req.adapter  :net_http
    end
  end

  def post_to_watson
    conn.post do |req|
      req.headers['Authorization']
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
      req.body = "#{@tweets}"
    end
  end

  def analysis
    a = post_to_watson
    # a = JSON.parse(post_to_watson.response, symbolize_names: true)
    binding.pry
  end
end

class TweetsController < ApplicationController
  def index
    crypto_name = Crypto.find(params[:crypto_id]).name
    @analyzer = AnalyzerPresenter.new(crypto_name)
  end
end

# class AnalyzerPresenter
#   attr_reader :raw_tweets, :tweets, :document_analysis
#
#   def initialize(crypto)
#     @raw_tweets ||= TweetService.new(crypto).return_tweets
#   end
#
#   def join_raw_tweets
#     @raw_tweets.map(&:text).join
#   end
#
#   def analyze_tweets
#     @tweets ||= WatsonService.new(join_raw_tweets).analyzed_tweets
#     @document_analysis ||= WatsonService.new(join_raw_tweets).document_analysis
#   end
# end

# class WatsonService
#   def initialize(raw_tweets)
#     @raw_tweets = raw_tweets
#   end
#
#   def conn
#     Faraday.new(url: ENV['watson_base_url']) do |req|
#       req.basic_auth(ENV['watson_username'], ENV['watson_password'])
#       req.request  :url_encoded
#       req.response :logger
#       req.adapter  :net_http
#     end
#   end
#
#   def post_to_watson(tweets = @raw_tweets)
#     conn.post do |req|
#       req.headers['Authorization']
#       req.headers['Content-Type'] = 'text/plain;charset=utf-8'
#       req.body = "#{tweets}"
#     end
#   end
#
#   def analysis_service
#     @analysis ||= JSON.parse(post_to_watson.body, symbolize_names: true)
#   end
#
#   def analyzed_tweets
#     analysis_service[:sentences_tone].map do |sentence|
#       next if sentence[:tones].empty?
#       Tweet.create({ text: sentence[:text],
#                      score: sentence[:tones][0][:score],
#                      tone_id: sentence[:tones][0][:tone_id],
#                      tone_name: sentence[:tones][0][:tone_name] })
#     end.compact
#   end
#
#   def new_document_analysis
#     @new_document_analysis ||= JSON.parse(post_to_watson(analyzed_tweets).body, symbolize_names: true)
#   end
#
#
#   def document_analysis
#     new_document_analysis[:document_tone][:tones].map do |tone|
#       Tone.new(tone)
#     end
#   end
# end

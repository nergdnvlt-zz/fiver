
namespace :import do

  desc 'Populate database with BTC tweets'
  task all: :environment do
    clean_database
    pull_btc_tweets
    pull_eth_tweets
    pull_xrp_tweets
    pull_ltc_tweets
  end

  def clean_database
    Tweet.destroy_all
  end

  def pull_btc_tweets
    TweetAnalyzer.new('Bitcoin', 1).analyzed_tweets
  end

  def pull_eth_tweets
    TweetAnalyzer.new('Litecoin', 2).analyzed_tweets
  end

  def pull_xrp_tweets
    TweetAnalyzer.new('Ripple', 3).analyzed_tweets
  end

  def pull_ltc_tweets
    TweetAnalyzer.new('Litecoin', 4).analyzed_tweets
  end
end

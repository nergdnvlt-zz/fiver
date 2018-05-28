require 'rails_helper'

describe WatsonService do
  VCR.use_cassette('/services/watson_service') do
    it 'returns analyzed tweets' do
      raw_tweets = 'This is absolutely amazing!!! This is utterly intoxicating.'
      tweets = WatsonService.new(raw_tweets).analyzed_tweets
      binding.pry
    end
  end
end

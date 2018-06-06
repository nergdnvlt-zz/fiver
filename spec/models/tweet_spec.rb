require 'rails_helper'

describe Tweet do
  describe 'validations' do
    it { should validate_presence_of :text }
  end

  describe 'relationships' do
    it { belong_to :tone }
    it { belong_to :crypto }
  end

  describe 'instance methods' do
    it '#save_text' do
      crypto = Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
      tone = Tone.create!(tone_name: 'Anger')
      tweet = crypto.tweets.create!(tone: tone, text: "Are there any functional BTC plugins for WooCommerce that don't use 3rd party vendors?Bill Regulating Blockchains Dies In Committee@PaulManafort They weren't after him: there were concerns about some of his investment activities/fun… https://t.co/JlxNdOYLQz$BTC#bitcoin 1hr looking bearish all the way down to soft support at 7200.am happy to follow this project because my project is in line with the thinking and what I want #Crypto… https://t.co/k8rEcMFki1If#Bitcoin is a #Bubble, Final Stage of ‘#Panic’ on the #Horizon https://t.co/Ba7fnXOiPxto open bitcoin exchange in Japan https://t.co/SJ86VkRAYYhttps://t.co/u0n93m0xDL / Bitcoin Token  #Airdrop  🌕🌕🌕👏    Join in this Airdrop of 2000 BTK  Europe: Apple Co-Founder Hedges His Bets On Bitcoin https://t.co/X0LtoElKhcTelegram")

      expect(tweet.text).to_not include('http')
    end
  end
end

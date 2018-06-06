require 'rails_helper'

describe Document do
    let(:attrs){ { :document_tone=>{:tones=>[{:score=>0.572217, :tone_id=>"analytical", :tone_name=>"Analytical"}]},
                   :sentences_tone=>
                    [{:sentence_id=>0,
                      :text=>"Firm Is Way Ahead of Wall Street on Bitcoin via @NYTimes.Interesting take on SIG trading crypto  s://t.co/yZCjvtiQn9@the_squirrel22@TeamplatinumQ",
                      :tones=>[{:score=>0.560944, :tone_id=>"confident", :tone_name=>"Confident"}]},
                     {:sentence_id=>1, :text=>"@WolmaransSarel By the look of that directory of #dream #freelancers, there is a cat…  s://t.co/wLELlPh6zrTopUpto", :tones=>[]},
                     {:sentence_id=>2,
                      :text=>"10% Referral CommissionApple Shows Just How Broken Our Food System Is#Cryptocurrency #ICO #Blockchain…  s://t.co/QzBPYEozoyBitcoin,@sassal0x",
                      :tones=>
                       [{:score=>0.626142, :tone_id=>"sadness", :tone_name=>"Sadness"},
                        {:score=>0.730335, :tone_id=>"analytical", :tone_name=>"Analytical"},
                        {:score=>0.525007, :tone_id=>"tentative", :tone_name=>"Tentative"}]},
                     {:sentence_id=>3,
                      :text=>
                       "@loomnetwork @0xProject All the respect for Bitcoin, but its overall design makes these sol…  s://t.co/UWC8ufd0cAWeexample of resistance turning into support for $OCN#Hacker Cryptocurrency: The No-Nonsense Starter Guide to Mastering Bitcoin, Blockchain &amp; The…  s://t.co/P28L8DaxDL@BitcoinDory",
                      :tones=>[{:score=>0.742297, :tone_id=>"joy", :tone_name=>"Joy"}]},
                     {:sentence_id=>4,
                      :text=>".Just keep printing, just keep printing.Join #syscoin on @telegram and stay up to-date!$SYS #blockchain #fintech #bitcoin #baas  s://t.co/cHh9g1Gylvr/Crypto_Currency_News▶️…",
                      :tones=>[{:score=>0.503674, :tone_id=>"joy", :tone_name=>"Joy"}, {:score=>0.75152, :tone_id=>"tentative", :tone_name=>"Tentative"}]},
                     {:sentence_id=>5, :text=>"s://t.co/2V0S5XTHezHow is #blockchain going to change the music and video industry?$OSTK", :tones=>[{:score=>0.532616, :tone_id=>"analytical", :tone_name=>"Analytical"}]},
                     {:sentence_id=>6,
                      :text=>"was showing some momentum today.As #Zloadr gets closer to the full launch of its due diligence platform we want to co…  s://t.co/y7cPNcD62Y5Every",
                      :tones=>[{:score=>0.609743, :tone_id=>"sadness", :tone_name=>"Sadness"}]},
                     {:sentence_id=>7,
                      :text=>"retail store &amp; restaurant will accept Bitcoin as a #1 payment method.Invest in Your Future.@rafaelmagu@SharesiesNZ",
                      :tones=>[{:score=>0.548904, :tone_id=>"analytical", :tone_name=>"Analytical"}]},
                     {:sentence_id=>8,
                      :text=>
                       "I see you have low expectations.You should try solo-mining bitcoin on a CPU.LOVE!!The GambiaWe hope to help, thank you.Wish List  s://t.co/kd453LxDORBitcoin is not the 'panacea' people thought it would be, Ripple CEO says  s://t.co/TydG3benI4@reddit@cryptostratton @lambolifeof That’s very poetic and philosophically I do like that concept but In…  s://t.co/pnhKssXMmvBitcoin#bch",
                      :tones=>[]},
                     {:sentence_id=>9,
                      :text=>"#bitcoin cashOrder your secure and smart BTC/ETH/Altcoin hardware wallet - Only 94.80 EUR  s://t.co/WC9nt6z1jzvia",
                      :tones=>[{:score=>0.638987, :tone_id=>"confident", :tone_name=>"Confident"}]},
                     {:sentence_id=>10,
                      :text=>"@YouTubeCaratz Very intresting Idea.I will follow it till the last, Great project.Good trusted project on a unique concep…  s://t.co/RSs35JbkQo@SoakerPatoshi@MirakhorHassan",
                      :tones=>[{:score=>0.77278, :tone_id=>"joy", :tone_name=>"Joy"}, {:score=>0.509368, :tone_id=>"confident", :tone_name=>"Confident"}]},
                     {:sentence_id=>11,
                      :text=>
                       "Looking forward to watching the show.like to think that I am allowed to kill cops.I won't because that would be tacky.But I can.CNBC: Don’t Believe the Bitcoin Bears, Says Fundstrat’s Tom LeeThats why you are for lightning network then and arent a known cancer to bitcoin.Some bullish momentum detected in $BTC $BTCUSD #Bitcoin #cryptocurrency  s://t.co/wYqwLVjzTT#BitStash",
                      :tones=>[{:score=>0.502273, :tone_id=>"sadness", :tone_name=>"Sadness"}, {:score=>0.553846, :tone_id=>"analytical", :tone_name=>"Analytical"}]}]}}
  describe 'instance methods' do
    it '#makes_tones' do
      tones = Document.new(attrs).make_tones

      expect(tones).to be_a Array
      expect(tones[0].keys).to eq([:tone_name])
      expect(tones[0].values).to eq(['Analytical'])
    end

    it 'constructs json' do
      tones = Document.new(attrs).as_json

      expect(tones).to be_a Hash
      expect(tones[:tones][0].keys).to eq([:tone_name])
      expect(tones[:tones][0].values).to eq(['Analytical'])
    end
  end
end

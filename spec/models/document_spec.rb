# require 'rails_helper'
#
# describe Document do
#   let(:input_string){ "Are there any functional BTC plugins for WooCommerce that don't use 3rd party vendors?Bill Regulating Blockchains Dies In Committee@PaulManafort They weren't after him: there were concerns about some of his investment activities/fun… https://t.co/JlxNdOYLQz$BTC#bitcoin 1hr looking bearish all the way down to soft support at 7200.am happy to follow this project because my project is in line with the thinking and what I want #Crypto… https://t.co/k8rEcMFki1If#Bitcoin is a #Bubble, Final Stage of ‘#Panic’ on the #Horizon https://t.co/Ba7fnXOiPxto open bitcoin exchange in Japan https://t.co/SJ86VkRAYYhttps://t.co/u0n93m0xDL / Bitcoin Token  #Airdrop  🌕🌕🌕👏    Join in this Airdrop of 2000 BTK  Europe: Apple Co-Founder Hedges His Bets On Bitcoin https://t.co/X0LtoElKhcTelegram" }
#
#   describe 'class methods' do
#     it '#as_json' do
#       VCR.use_cassette('/models/document_class-BTC') do
#         tones = Document.as_json(input_string)
#
#         expect(tones).to be_a Hash
#         expect(tones.keys).to eq([:tones])
#         expect(tones[:tones]).to be_a Array
#         expect(tones[:tones][0].keys).to eq([:tone_name])
#         expect(tones[:tones][0].values).to eq(['Joy'])
#       end
#     end
#   end
#
#   describe 'instance methods' do
#     it 'constructs json' do
#       VCR.use_cassette('/models/document_instance-BTC') do
#         tones = Document.new(input_string).as_json
#
#         expect(tones).to be_a Hash
#         expect(tones.keys).to eq([:tones])
#         expect(tones[:tones]).to be_a Array
#         expect(tones[:tones][0].keys).to eq([:tone_name])
#         expect(tones[:tones][0].values).to eq(['Joy'])
#       end
#     end
#   end
# end

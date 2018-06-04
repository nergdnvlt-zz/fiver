# require 'rails_helper'
#
# feature 'User selects currency' do
#   scenario 'and sees tweets associated with that currency' do
#     VCR.use_cassette('/features/user_sees_watson_feed_back') do
#       Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
#       Crypto.create!(name: 'Ethereum', symbol: 'ETH')
#       user = create(:user)
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#
#       # When I visit a userpage
#       visit "/#{user.slug}"
#
#       select "Bitcoin", :from => "crypto_id"
#       find('input[name="commit"]').click
#
#       # Expect to see 10 tweets on a page
#       expect(current_path).to eq(tweets_path)
#
#       # click_on 'Watson Data'
#       find('.get_watson_button').click
#
#       sleep 3
#       save_and_open_page
#       expect(page).to have_css('.tone-name')
#     end
#   end
# end

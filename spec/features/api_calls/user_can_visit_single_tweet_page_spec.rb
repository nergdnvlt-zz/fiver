require 'rails_helper'

feature 'User selects currency' do
  scenario 'and sees tweets associated with that currency' do
    VCR.use_cassette('/features/user_sees_single_feed_back') do
      Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
      tweet = Tweet.create!(text: 'bitcoin ftw', score: "0.888", tone_id: 'joy', tone_name: "Joy")
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/tweets/#{tweet.id}"

      expect(page).to have_css('.tone-name')
      expect(page).to have_content('Tweet')
      expect(page).to have_content('Tones')
    end
  end
end

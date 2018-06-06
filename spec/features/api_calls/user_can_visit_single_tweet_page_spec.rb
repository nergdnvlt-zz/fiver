require 'rails_helper'

feature 'User selects currency' do
  scenario 'and sees tweets associated with that currency' do
    crypto = Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
    tone = Tone.create!(tone_name: 'Joy')
    tweet = crypto.tweets.create!(text: 'bitcoin ftw', tone: tone)

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/tweets/#{tweet.id}"

    expect(page).to have_css('.tone-name')
    expect(page).to have_content('Tweet')
    expect(page).to have_content('Tones')
  end
end

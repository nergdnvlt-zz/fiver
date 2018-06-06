require 'rails_helper'

feature 'User selects currency' do
  scenario 'and sees tweets associated with that currency' do
    tone = Tone.create!(tone_name: 'Anger')
    crypto = Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
    tweet1 = crypto.tweets.create!(text: 'bitcoin ftw', tone: tone)
    tweet2 = crypto.tweets.create!(text: 'yay', tone: tone)
    tweet3 = crypto.tweets.create!(text: 'wonderbread', tone: tone)
    tweet4 = crypto.tweets.create!(text: 'winning', tone: tone)
    tweet5 = crypto.tweets.create!(text: 'losing', tone: tone)
    tweet6 = crypto.tweets.create!(text: 'tired', tone: tone)
    tweet7 = crypto.tweets.create!(text: 'appalachian', tone: tone)
    tweet8 = crypto.tweets.create!(text: 'thrasher', tone: tone)
    tweet9 = crypto.tweets.create!(text: 'fluffy', tone: tone)
    tweet10 = crypto.tweets.create!(text: 'dynamic', tone: tone)

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # When I visit a userpage
    visit "/#{user.slug}"

    select "Bitcoin", :from => "crypto_id"
    find('input[name="commit"]').click

    # Expect to see 10 tweets on a page
    expect(current_path).to eq(tweets_path)
    expect(page).to have_css('.tweet', count: 10)
    expect(page).to have_content(tweet1.text)
    expect(page).to have_content(tweet2.text)
    expect(page).to have_content(tweet3.text)
    expect(page).to have_content(tweet4.text)
    expect(page).to have_content(tweet5.text)
    expect(page).to have_content(tweet6.text)
    expect(page).to have_content(tweet7.text)
    expect(page).to have_content(tweet8.text)
    expect(page).to have_content(tweet9.text)
    expect(page).to have_content(tweet10.text)
  end
end

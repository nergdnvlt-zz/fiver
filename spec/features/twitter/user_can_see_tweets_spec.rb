require 'rails_helper'

feature 'User selects currency' do
  scenario 'and sees tweets associated with that currency' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # When I visit a userpage
    visit "/#{user.slug}"

    # Select a currency from the dropdown
    select 'Bitcoin', from: 'currency[id]'
    click_on 'Get Tweets!'

    # Expect to see 10 tweets on a page
    expect(current_path).to eq(tweets_path)
    expect(page).to have_css('.tweet', count: 10)
  end
end

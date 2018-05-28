require 'rails_helper'

feature 'User selects currency' do
  scenario 'and sees tweets associated with that currency' do
    VCR.use_cassette('/features/user_sees_watson_feed_back') do
      Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
      Crypto.create!(name: 'Ethereum', symbol: 'ETH')
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.slug}"

      select "Bitcoin", :from => "crypto_id"
      find('input[name="commit"]').click

      within(first('.tweet')) do
        find('h6').click
      end

      expect(page).to have_css('.tone-name')
      expect(page).to have_content('Tweet')
      expect(page).to have_content('Tones')
    end
  end
end

require 'rails_helper'

feature 'a user can create an account' do
  scenario 'with entering their personal info' do
    visit '/'

    click_on 'Register'

    fill_in 'Name', with: 'Thor Odinson'
    fill_in 'Username', with: 'fatherwar'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    fill_in 'Password confirmation', with: 'test'

    click_on 'Register'

    expect(page).to have_content('Welcome fatherwar')
  end
end

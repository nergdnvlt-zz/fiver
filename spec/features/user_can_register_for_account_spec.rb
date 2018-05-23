require 'rails_helper'

feature 'a user can create an account' do
  scenario 'with entering their personal info' do
    visit '/'

    click_on 'Register'

    fill_in user[:full_name], with: 'Thor Odinson'
    fill_in user[:username], with: 'fatherwar'
    fill_in user[:email], with: 'test@test.com'
    fill_in user[:password], with: 'test'
    fill_in user[:password_confirmation], with: 'test'

    click_on 'Create Account'

    expect(page).to have_content('Welcome Thor Odinson')
  end
end

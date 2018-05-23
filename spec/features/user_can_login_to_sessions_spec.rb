require 'rails_helper'

feature 'An existing user' do
  scenario 'can login' do
    visit '/'

    click_on 'Login'

    fill_in 'Username', with: 'fatherwar'
    fill_in 'Password', with: 'test'

    click_on 'Login'

    expect(page).to have_content('Welcome fatherwar')
  end
end

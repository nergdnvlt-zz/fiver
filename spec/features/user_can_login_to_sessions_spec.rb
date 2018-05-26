require 'rails_helper'

feature 'An existing user' do
  scenario 'can login' do
    user1 = create(:native_user)
    visit '/'

    within('.welcome-login') do
      click_on 'Login'
    end

    fill_in 'Username', with: user1.username
    fill_in 'Password', with: user1.password

    click_on 'Login'

    expect(current_path).to eq(user_path(user1.slug))
    expect(page).to have_content(user1.username)
  end

  scenario 'can log back out' do
    user1 = create(:native_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit "/#{user1.slug}"

    click_on 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Login')
  end
end

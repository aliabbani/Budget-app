require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: 'travel-icon')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit new_group_path
  end

  scenario 'display My Groups on page' do
    expect(page).to have_content('Add your category')
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_button 'Save'
  end
end

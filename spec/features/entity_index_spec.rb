require 'rails_helper'

RSpec.feature 'Entity index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: fixture_file_upload('Padget.png'))
    @entity = @group.entities.create(name: 'india', amount: 1500, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit group_entities_path(@group.id)
  end

  scenario 'display My Entitys on page' do
    expect(page).to have_content('Travel\'s transactions')
    expect(page).to have_content('Total spent:')
  end

  scenario 'display Entity details on page' do
    expect(page).to have_content @entity.name
    expect(page).to have_content @entity.amount
  end

  scenario 'display Add new transaction button on page' do
    expect(page).to have_link 'Add transaction'
  end

  scenario 'When I click on Add transaction, I am redirected to that Entity\'s new page.' do
    click_link('Add transaction')
    expect(page).to have_current_path new_group_entity_path(@group.id)
  end
end

require 'rails_helper'
require 'capybara/rspec'

describe 'Groups controller', type: :feature do
  before :each do
    user = User.new(username: 'manas', name: 'Manas Aizhigitov')
    user.save
    medicine = Medicine.new(name: 'adrenaline', amount: 300, author_id: user.id)
    medicine.save
    visit '/login'
    within('form') do
      fill_in 'session_username', with: 'manas'
    end
    click_button 'Log in'
  end

  it 'creates group' do
    visit '/groups/new'
    within('form') do
      fill_in 'group[name]', with: 'test group'
      fill_in 'group[icon]', with: 'https://cdn.iconscout.com/icon/free/png-256/fast-food-1851561-1569286.png'
    end
    click_button 'Create'
    expect(page).to have_content 'All Groups'
  end
end

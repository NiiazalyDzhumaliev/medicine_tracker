require 'rails_helper'
require 'capybara/rspec'

describe 'Medicines controller', type: :feature do
  before :each do
    user = User.new(username: 'talas', name: 'Tanas Aizhigitov')
    user.save
    medicine = Medicine.new(name: 'adrenaline', amount: 300, author_id: user.id)
    medicine.save
    visit '/login'
    within('form') do
      fill_in 'session_username', with: 'talas'
    end
    click_button 'Log in'
  end

  it 'creates medicine' do
    visit '/medicines/new'
    within('form') do
      fill_in 'medicine[name]', with: 'adrenaline'
      fill_in 'medicine[amount]', with: '300'
    end
    click_button 'Create'
    expect(page).to have_content 'All Ungroupped Medicines'
  end
end
require 'rails_helper'
require 'capybara/rspec'

describe 'Sessions controller', type: :feature do
  before :each do
    user = User.new(username: 'manas', name: 'Manas Aizhigitov')
    user.save
    visit '/login'
    within('form') do
      fill_in 'session_username', with: 'manas'
    end
    click_button 'Log in'
  end

  it 'creates user' do
    expect(page).to have_content 'Manas Aizhigitov'
  end
end
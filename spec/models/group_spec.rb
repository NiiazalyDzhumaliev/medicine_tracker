require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Group, type: :model do
  context 'Check for validation of group input' do
    it 'is valid with valid attributes' do
      expect(Group.create).to_not be_valid
    end

    it 'is not valid without a name' do
      expect(Group.new(name: nil)).to_not be_valid
    end

    it 'is valid without an icon' do
      expect(Group.new(name: 'hormones', icon: nil)).to_not be_valid
    end
  end

  it 'should have many medicines' do
    t = Group.reflect_on_association(:medicines)
    expect(t.macro).to eq(:has_many)
  end
end

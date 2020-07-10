require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Check for validation of user input' do
    it 'is valid with valid attributes' do
      expect(User.create).to_not be_valid
    end

    it 'is not valid without a username' do
      expect(User.new(username: nil)).to_not be_valid
    end

    it 'is not valid without an name' do
      expect(User.new(name: nil)).to_not be_valid
    end

    it 'should have many medicines' do
      t = User.reflect_on_association(:medicines)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many groups' do
      t = User.reflect_on_association(:groups)
      expect(t.macro).to eq(:has_many)
    end
  end
end

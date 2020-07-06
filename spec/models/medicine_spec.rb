require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Medicine, type: :model do
  context 'validation tests' do
    it "Shouldn't save if there's no name" do
      medicine = Medicine.new(amount: 500)
      expect(medicine.save).to eq(false)
    end

    it "Shouldn't save if name is less than 2 characters" do
      medicine = Medicine.new(name: 'b', amount: 500)
      expect(medicine.save).to eq(false)
    end

    it "Shouldn't save if name is more than 15 characters" do
      medicine = Medicine.new(name: 'karambarumbababa', amount: 500)
      expect(medicine.save).to eq(false)
    end

    it "Shouldn't save if there's no amount" do
      medicine = Medicine.new(name: 'vitamin c')
      expect(medicine.save).to eq(false)
    end

    it "Shouldn't save if the amount is more than 1000" do
      medicine = Medicine.new(name: 'banana', amount: 2000)
      expect(medicine.save).to eq(false)
    end
  end

  context 'Association tests' do
    it { should belong_to(:author) }
  end
end

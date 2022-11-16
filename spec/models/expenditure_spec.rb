require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  describe 'associations' do
    it 'should belong to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    it 'is not valid without an amount' do
      expenditure = Expenditure.new(amount: nil, name: 'name')
      expect(expenditure).to_not be_valid
    end

    it 'is not valid without a name' do
      expenditure = Expenditure.new(amount: 1, name: nil)
      expect(expenditure).to_not be_valid
    end

    it 'is not valid with a name longer than 80 characters' do
      expenditure = Expenditure.new(amount: 1, name: 'a' * 81)
      expect(expenditure).to_not be_valid
    end

    it 'is not valid with an amount less than 1' do
      expenditure = Expenditure.new(amount: 0, name: 'name')
      expect(expenditure).to_not be_valid
    end
  end
end

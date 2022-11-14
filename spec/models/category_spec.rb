require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'should belong to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'should have many expenditures' do
      association = described_class.reflect_on_association(:expenditures)
      expect(association.macro).to eq :has_many
    end
  end
    
    describe 'validations' do
      it 'is not valid without a name' do
        category = Category.new(name: nil, icon: 'icon')
        expect(category).to_not be_valid
      end

      it 'is not valid without an icon' do
        category = Category.new(name: 'name', icon: nil)
        expect(category).to_not be_valid
      end

      it 'is not valid with a name longer than 80 characters' do
        category = Category.new(name: 'a' * 81, icon: 'icon')
        expect(category).to_not be_valid
      end
  end
end

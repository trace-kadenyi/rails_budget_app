require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq :has_many
    end

    it 'should have many expenditures' do
      association = described_class.reflect_on_association(:expenditures)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'john', email: 'john@gmail.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil, email: 'john@gmail.com', password: '123456')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'john', email: nil, password: '123456')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'john', email: 'john@gmail.com', password: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a name longer than 80 characters' do
      user = User.new(name: 'a' * 81, email: 'john@gmail.com', password: '123456')
      expect(user).to_not be_valid
    end

    it 'is not valid with an email longer than 80 characters' do
      user = User.new(name: 'john', email: 'a' * 81, password: '123456')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password shorter than 6 characters' do
      user = User.new(name: 'john', email: 'john@gmail.com', password: '12345')
      expect(user).to_not be_valid
    end
  end
end

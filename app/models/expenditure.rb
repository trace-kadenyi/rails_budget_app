class Expenditure < ApplicationRecord
  belongs_to :user
  has_many :category_expenditures, foreign_key: :expenditure_id, dependent: :destroy
  has_many :categories, through: :expense_categories, foreign_key: 'expenditure_id'

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, length: { in: 1..80 }
end

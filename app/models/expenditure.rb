class Expenditure < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :category_expenditures, foreign_key: :expenditure_id, dependent: :destroy

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, length: { in: 1..80 }
end

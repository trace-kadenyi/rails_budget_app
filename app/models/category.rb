class Category < ApplicationRecord
  belongs_to :user
  has_many :expenditures, foreign_key: :category_id, dependent: :destroy

  validates :name, presence: true, length: { in: 1..80 }
end

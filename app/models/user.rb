class User < ApplicationRecord
  has_many :expenditures, foreign_key: :user_id, dependent: :destroy
  has_many :categories, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true, length: { in: 1..80 }
  validates :email, presence: true, length: { in: 1..80 }, uniqueness: true
  validates :password, presence: true, length: { in: 6..80 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

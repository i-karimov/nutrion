class FoodCategory < ApplicationRecord
  validates :description, presence: true, length: { minimum: 2 }
  validates :code, uniqueness: true

  has_many :foods
end

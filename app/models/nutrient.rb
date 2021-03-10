class Nutrient < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}

  has_many :food_nutrients
end

class Food < ApplicationRecord
  resourcify

  belongs_to :wweia_food_category
  has_many :food_nutrients, dependent: :destroy
  has_many :nutrients, through: :food_nutrients
end

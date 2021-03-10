class FoodNutrient < ApplicationRecord
  defualt_scope { first(100) }
  belongs_to :food
  belongs_to :nutrient
end

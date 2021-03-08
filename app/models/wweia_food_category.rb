class WweiaFoodCategory < ApplicationRecord
  has_many :foods, foreign_key: :food_category_id
end

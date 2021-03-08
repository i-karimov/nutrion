class WweiaFoodCategory < ApplicationRecord
  resourcify

  has_many :foods, foreign_key: :food_category_id
end

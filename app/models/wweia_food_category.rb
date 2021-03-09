class WweiaFoodCategory < ApplicationRecord
  resourcify

  has_many :foods
end

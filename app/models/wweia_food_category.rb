class WweiaFoodCategory < ApplicationRecord
  resourcify

  has_many :foods

  def name
    description
  end
end

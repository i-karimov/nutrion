class Food < ApplicationRecord
  resourcify

  translates :description
  globalize_accessors locales: [:en, :ru], attributes: [:description]

  belongs_to :wweia_food_category, optional: true
  has_many :food_nutrients, dependent: :destroy
  has_many :nutrients, through: :food_nutrients

  def name
    description
  end
end

class Nutrient < ApplicationRecord
  include Translation
  
  validates :name, presence: true, length: { minimum: 3 }

  translates :name
  globalize_accessors locales: [:en, :ru], attributes: [:name]
end

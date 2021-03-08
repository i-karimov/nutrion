module Types
  class WweiaFoodCategoryType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :foods, [Types::FoodType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :foods_count, Integer, null: true

    def foods_count
      object.foods.size
    end
  end
end

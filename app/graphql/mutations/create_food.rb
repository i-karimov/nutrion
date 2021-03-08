class Mutations::CreateFood < Mutations::BaseMutation
  argument :description, String, required: true
  argument :wweia_food_category_id, ID, required: false

  field :food, Types::FoodType, null: false
  field :errors, [String], null: false

  def resolve(description:, wweia_food_category_id:)
    food = Food.new(description: description, wweia_food_category_id: wweia_food_category_id)
    
    if food.save
      {
        food: food,
        errors: []
      }
    else
      {errors: food.errors.full_messages}
    end
  end
end
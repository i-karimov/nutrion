module Types
  class MutationType < Types::BaseObject
    field :create_food, mutation: Mutations::CreateFood
  end
end

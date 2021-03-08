module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

   # /foods
   field :foods, [Types::FoodType], null: false

   field :food, Types::FoodType, null: false do
    argument :id, ID, required: true
   end

   def foods
    Food.first(100)
   end

   def food(id:)
    Food.find(id)
   end
  end
end

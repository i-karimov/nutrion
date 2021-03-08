class CreateWweiaFoodCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :wweia_food_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end

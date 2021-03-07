class CreateFoodCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :food_categories do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
    add_index :food_categories, :code
  end
end

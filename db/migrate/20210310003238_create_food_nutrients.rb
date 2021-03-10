class CreateFoodNutrients < ActiveRecord::Migration[6.1]
  def change
    create_table :food_nutrients do |t|
      t.references :food, null: false, foreign_key: true
      t.references :nutrient, null: false, foreign_key: true
      t.float :amount
      t.integer :data_points
      t.float :min
      t.float :max
      t.float :median
      t.string :footnote
      t.integer :min_year_acquired

      t.timestamps
    end
  end
end

class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :data_type
      t.string :description
      t.bigint :wweia_food_category_id, index: true
      t.date :publication_date

      t.timestamps
    end
  end
end

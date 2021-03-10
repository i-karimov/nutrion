class CreateNutrients < ActiveRecord::Migration[6.1]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.string :unit_name
      t.integer :nutrient_nbr
      t.integer :rank

      t.timestamps
    end
    add_index :nutrients, :unit_name
    add_index :nutrients, :nutrient_nbr
    add_index :nutrients, :rank
  end
end

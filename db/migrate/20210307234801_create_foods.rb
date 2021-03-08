class CreateFoods < ActiveRecord::Migration[6.1]
  def up
    create_table :foods do |t|
      t.string :data_type
      t.string :description
      t.bigint :wweia_food_category_id, index: true
      t.date :publication_date

      t.timestamps
    end

    # Food ids uploaded from CSV-file have significant gaps.
    # By defult RDMS will try to fill these voids
    # This can create unnecessary problems, so ID sequence has been altered:
    execute "ALTER SEQUENCE foods_id_seq MINVALUE 167512 OWNED BY foods.id START WITH 1105904 RESTART 1105904;"
  end

  def down
    drop_table :foods
  end
end

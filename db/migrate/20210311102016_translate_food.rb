class TranslateFood < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        Food.create_translation_table!({ 
                                         description: :string, 
                                       }, {
                                         migrate_data: true,
                                         remove_source_columns: true
                                       })
      end

      dir.down do
        Food.drop_translation_table! migrate_data: true
      end
    end
  end
end


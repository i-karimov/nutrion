ActiveAdmin.register Food do
  permit_params :description, :data_type, :wweia_food_category_id, :publication_date

  index do
    selectable_column
    id_column
    column :description
    column :data_type
    columns
    actions
  end

  controller do
    before_action { @per_page = 100 }
  end
  remove_filter :food_nutrients

  show do
    attributes_table(:id, :description, :data_type)

    panel 'simple panel' do
      table_for resource.food_nutrients.order(:data_points) do
        column(:amount)
        column(:data_points)
        column(:min)
      end
    end
  end
end

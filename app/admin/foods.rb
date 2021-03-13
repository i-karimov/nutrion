ActiveAdmin.register Food do
  permit_params :description, :data_type, :wweia_food_category_id, :publication_date

  controller do
    before_action { @per_page = 100 }
  end
  remove_filter :food_nutrients
end

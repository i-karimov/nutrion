ActiveAdmin.register Food do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :descripton, :data_type, :wweia_food_category_id, :publication_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:data_type, :description, :wweia_food_category_id, :publication_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :food_nutrients 


end

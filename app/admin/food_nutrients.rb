ActiveAdmin.register FoodNutrient do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :amount, :data_points, :min, :max, :median, :footnote, :min_year_acquired
  #
  # or
  #
  # permit_params do
  #   permitted = [:food_id, :nutrient_id, :amount, :data_points, :min, :max, :median, :footnote, :min_year_acquired]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :food
end

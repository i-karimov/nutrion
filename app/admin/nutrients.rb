ActiveAdmin.register Nutrient do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :unit_name, :nutrient_nbr, :rank

  index do
    selectable_column
    id_column
    column :name
    column :data_type
    columns
    actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :unit_name, :nutrient_nbr, :rank]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end

ActiveAdmin.register Menu do
  permit_params :discipline, :rep, :set, :weight, :calorie

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :discipline, :rep, :set, :weight, :calorie
  #
  # or
  #
  # permit_params do
  #   permitted = [:discipline, :rep, :set, :weight, :calorie]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end

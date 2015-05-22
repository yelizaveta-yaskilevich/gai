ActiveAdmin.register Person do
  menu label: 'Граждане', priority: 4

  permit_params :first_name, :middle_name, :last_name, :address_region,
    :address_area, :address_city, :address_street, :address_house, :address_flat


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end

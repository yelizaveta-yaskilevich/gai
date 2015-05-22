ActiveAdmin.register Vehicle do
  menu label: 'Транспортные средства', priority: 1

  permit_params :vin, :vehicle_model_id, :vehicle_color_id, :year, :person_id
end

ActiveAdmin.register VehicleCategory do
  menu label: 'ТС - Категории', parent: 'Справочник', priority: 5
  config.sort_order = 'name_asc'
end

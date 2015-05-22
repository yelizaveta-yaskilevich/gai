ActiveAdmin.register VehicleModel do
  menu label: 'ТС - Модели', parent: 'Справочник', priority: 5
  config.sort_order = 'name_asc'
end

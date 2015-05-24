ActiveAdmin.register VehicleColor do
  config.sort_order = 'name_asc'

  menu label: 'ТС - Цвета', parent: 'Справочник', priority: 5

  filter :name, label: 'Наименование'

  index title: 'Цвета транспортных средств' do
    column 'Наименование', sortable: 'name' do |vehicle_color|
      link_to vehicle_color.name, admin_vehicle_color_path(vehicle_color)
    end
  end

  permit_params :name

  form do |f|
    inputs 'Цвет транспортных средств' do
      input :name, label: 'Наименование'
    end
    actions
  end

  show do
    panel 'Цвет транспортных средств' do
      attributes_table_for vehicle_color do
        row('Наименование'){ vehicle_color.name }
      end
    end
  end
end

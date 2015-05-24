ActiveAdmin.register VehicleCategory do
  config.sort_order = 'name_asc'

  menu label: 'ТС - Категории', parent: 'Справочник', priority: 5

  filter :name, label: 'Наименование'

  index title: 'Категории транспортных средств' do
    column 'Наименование', sortable: 'name' do |vehicle_category|
      link_to vehicle_category.name, admin_vehicle_category_path(vehicle_category)
    end
    column 'Описание', :description, sortable: false
  end

  permit_params :name, :description

  form do |f|
    inputs 'Категория транспортных средств' do
      input :name, label: 'Наименование'
      input :description, label: 'Описание'
    end
    actions
  end

  show do
    panel 'Категория транспортных средств' do
      attributes_table_for vehicle_category do
        row('Наименование'){ vehicle_category.name }
        row('Описание'){ vehicle_category.description }
      end
    end
  end
end

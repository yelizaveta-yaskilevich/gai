ActiveAdmin.register VehicleModel do
  config.sort_order = 'name_asc'

  menu label: 'ТС - Модели', parent: 'Справочник', priority: 5

  filter :name, label: 'Наименование'

  index title: 'Модели транспортных средств' do
    column 'Наименование', sortable: 'name' do |vehicle_model|
      link_to vehicle_model.name, admin_vehicle_model_path(vehicle_model)
    end
  end

  permit_params :name

  form do |f|
    inputs 'Модель транспортных средств' do
      input :name, label: 'Наименование'
    end
    actions
  end

  show do
    panel 'Модель транспортных средств' do
      attributes_table_for vehicle_model do
        row('Наименование'){ vehicle_model.name }
      end
    end
  end
end

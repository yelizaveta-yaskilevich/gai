ActiveAdmin.register Vehicle do
  menu label: 'Транспортные средства', priority: 1

  index title: 'Транспортные средства' do
    column('Номер') do |vehicle|
      link_to vehicle.reg_number, admin_vehicle_path(vehicle)
    end
    column('Дата регистрации'){ |vehicle| vehicle.reg_issued_on }
    column('Владелец'){ |vehicle| vehicle.person.name }
    column('Модель'){ |vehicle| vehicle.vehicle_model.name }
    column('Цвет'){ |vehicle| vehicle.vehicle_color.name }
    column('Год выпуска'){ |vehicle| vehicle.year_of_manufacture }
  end

  filter :reg_number, label: 'Номер'
  filter :reg_issued_on, label: 'Дата регистрации'
  filter :person, label: 'Владелец'
  filter :vehicle_model, label: 'Модель'
  filter :vehicle_color, label: 'Цвет'
  filter :year_of_manufacture, label: 'Год выпуска'

  permit_params :reg_number, :reg_issued_on, :person_id, :vehicle_model_id,
    :vehicle_color_id, :vin, :year_of_manufacture

  form do |f|
    inputs 'Государственная регистрация' do
      input :reg_number, label: 'Регистрационный номер'
      input :reg_issued_on, label: 'Дата регистрации'
      input :person, label: 'Владелец'
    end

    inputs 'Технические данные' do
      input :vehicle_model, label: 'Модель'
      input :vehicle_color, label: 'Цвет'
      input :vin, label: 'VIN'
      input :year_of_manufacture, label: 'Год выпуска'
    end

    actions
  end

  show do
    panel 'Государственная регистрация' do
      attributes_table_for vehicle do
        row('Регистрационный номер'){ vehicle.reg_number }
        row('Дата регистрации'){ vehicle.reg_issued_on }
        row('Владелец'){ vehicle.person }
      end
    end
    panel 'Технические данные' do
      attributes_table_for vehicle do
        row('Модель'){ vehicle.vehicle_model.name }
        row('Цвет'){ vehicle.vehicle_color.name }
        row('VIN'){ vehicle.vin }
        row('Год выпуска'){ vehicle.year_of_manufacture }
      end
    end
  end
end

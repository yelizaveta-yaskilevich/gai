ActiveAdmin.register Vehicle do
  menu label: 'Транспортные средства', priority: 1

  controller do
    def scoped_collection
      super.includes(:vehicle_model, :vehicle_category, :vehicle_color, :person)
    end
  end

  index title: 'Транспортные средства' do
    column('Номер', sortable: 'reg_number') do |vehicle|
      link_to vehicle.reg_number, admin_vehicle_path(vehicle)
    end
    column('Категория ТС', sortable: 'vehicle_categories.name') do |vehicle|
      vehicle.vehicle_category.name
    end
    column('Модель', sortable: 'vehicle_models.name'){ |vehicle| vehicle.vehicle_model.name }
    column('Цвет', sortable: 'vehicle_colors.name'){ |vehicle| vehicle.vehicle_color.name }
    column('Год', :year_of_manufacture)
    column('Владелец', :person, sortable: 'people.last_name')
  end

  filter :reg_number, label: 'Номер'
  filter :vehicle_category, label: 'Категория ТС'
  filter :vehicle_model, label: 'Модель'
  filter :vehicle_color, label: 'Цвет'
  filter :year_of_manufacture, label: 'Год выпуска'
  filter :person, label: 'Владелец'

  permit_params :reg_number, :reg_issued_on, :person_id, :vehicle_model_id,
    :vehicle_color_id, :vin, :year_of_manufacture

  form do |f|
    columns do
      column do
        inputs 'Государственная регистрация' do
          input :reg_number, label: 'Номер'
          input :reg_issued_on, label: 'Дата', start_year: 1930, end_year: 2030
          input :person, label: 'Владелец'
        end
      end

      column do
        inputs 'Технические данные' do
          input :vehicle_model, label: 'Модель'
          input :vehicle_color, label: 'Цвет'
          input :vin, label: 'VIN'
          input :year_of_manufacture, label: 'Год выпуска'
        end
      end
    end

    actions
  end

  show do
    columns do
      column do
        panel 'Государственная регистрация' do
          attributes_table_for vehicle do
            row('Номер'){ vehicle.reg_number }
            row('Дата регистрации'){ vehicle.reg_issued_on }
            row('Владелец'){ vehicle.person }
          end
        end
      end

      column do
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

    panel 'Участие в ДТП' do
      table_for vehicle.accidents do
        column('Номер протокола') do |i|
          link_to i.protocol_number, admin_accident_path(i)
        end
        column('Время происшествия'){ |i| i.occured_at }
      end
    end
  end
end

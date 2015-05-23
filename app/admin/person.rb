ActiveAdmin.register Person do
  menu label: 'Граждане', priority: 4

  permit_params :first_name, :middle_name, :last_name, :passport_number,
    :passport_issued_by, :passport_issued_on, :address_region, :address_area,
    :address_city, :address_street, :address_house, :address_flat

  index title: 'Граждане' do
    column('ФИО') do |person|
      link_to person.name, admin_person_path(person)
    end
    column('Город'){ |person| person.address_city }
    column('Адрес'){ |person| person.short_address }
  end

  filter :passport, label: 'Паспорт'
  filter :last_name, label: 'Фамилия'
  filter :first_name, label: 'Имя'

  form do |f|
    columns do
      column do
        inputs 'Паспортные данные' do
          input :last_name, label: 'Фамилия'
          input :first_name, label: 'Имя'
          input :middle_name, label: 'Отчество'
          input :passport_number, label: 'Паспорт'
          input :passport_issued_by, label: 'Выдан'
          input :passport_issued_on, label: 'Дата', start_year: 1930, end_year: 2030
        end
      end

      column do
        inputs 'Адрес проживания' do
          input :address_region, label: 'Область'
          input :address_city, label: 'Город'
          input :address_area, label: 'Район'
          input :address_street, label: 'Улица'
          input :address_house, label: 'Дом'
          input :address_flat, label: 'Квартира'
        end
      end
    end
    actions
  end

  show do
    columns do
      column do
        panel 'Паспортные данные' do
          attributes_table_for person do
            row('Фамилия'){ person.last_name }
            row('Имя'){ person.first_name }
            row('Отчество'){ person.middle_name }
            row('Паспорт'){ person.passport_number }
            row('Выдан'){ person.passport_issued_by }
            row('Дата'){ person.passport_issued_on }
          end
        end
      end

      column do
        panel 'Адрес проживания' do
          attributes_table_for person do
            row('Область'){ person.address_region }
            row('Город'){ person.address_city }
            row('Район'){ person.address_area }
            row('Улица'){ person.address_street }
            row('Дом'){ person.address_house }
            row('Квартира'){ person.address_flat }
          end
        end
      end
    end

    panel 'Водительские удостоверения' do
      table_for person.licenses do
        column('Номер') do |license|
          link_to license.number, admin_license_path(license)
        end
        column('Дата выдачи'){ |license| license.issued_on }
        column('Дата завершения'){ |license| license.ended_on }
      end
    end

    panel 'Транспортные средства' do
      table_for person.vehicles do
        column('Регистрационный номер') do |vehicle|
          link_to vehicle.reg_number, admin_vehicle_path(vehicle)
        end
        column('Дата регистрации'){ |vehicle| vehicle.reg_issued_on }
        column('Модель'){ |vehicle| vehicle.vehicle_model.name }
        column('Цвет'){ |vehicle| vehicle.vehicle_color.name }
        column('Год выпуска'){ |vehicle| vehicle.year_of_manufacture }
        column('Кол-во ДТП'){ |vehicle| vehicle.accidents_count }
      end
    end
  end
end

ActiveAdmin.register Person do
  menu label: 'Граждане', priority: 4

  permit_params :passport, :first_name, :middle_name, :last_name, :address_region,
    :address_area, :address_city, :address_street, :address_house, :address_flat

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
    inputs 'Паспортные данные' do
      input :passport, label: 'Паспорт'
      input :last_name, label: 'Фамилия'
      input :first_name, label: 'Имя'
      input :middle_name, label: 'Отчество'
    end

    inputs 'Адрес проживания' do
      input :address_region, label: 'Область'
      input :address_city, label: 'Город'
      input :address_area, label: 'Район'
      input :address_street, label: 'Улица'
      input :address_house, label: 'Дом'
      input :address_flat, label: 'Квартира'
    end

    actions
  end

  show do
    panel 'Паспортные данные' do
      attributes_table_for person do
        row('Паспорт'){ person.passport }
        row('Фамилия'){ person.last_name }
        row('Имя'){ person.first_name }
        row('Отчество'){ person.middle_name }
      end
    end

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

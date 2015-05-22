ActiveAdmin.register Accident do
  menu label: 'ДТП', priority: 3

  permit_params :protocol_number, :occured_at, :notes

  index title: 'Дорожно-транспортные происшествия' do
    column('Протокол') do |accident|
      link_to accident.protocol_number, admin_accident_path(accident)
    end
    column('Время происшествия'){ |accident| accident.occured_at }
  end

  filter :protocol_number, label: 'Протокол'
  filter :occured_at, label: 'Время происшествия'

  form do |f|
    inputs 'Дорожно-транспортное происшествие' do
      input :protocol_number, label: 'Номер протокола'
      input :occured_at, label: 'Время происшествия'
      input :notes, label: 'Описание'
    end
    actions
  end

  show do
    panel 'Дорожно-транспортное происшествие' do
      attributes_table_for accident do
        row('Номер протокола'){ accident.protocol_number }
        row('Время происшествия'){ accident.occured_at }
        row('Описание'){ accident.notes }
      end
    end
  end
end

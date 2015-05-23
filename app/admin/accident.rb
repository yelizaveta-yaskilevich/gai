ActiveAdmin.register Accident do
  menu label: 'ДТП', priority: 3

  permit_params :protocol_number, :occured_at, :notes

  index title: 'Дорожно-транспортные происшествия' do
    column('Номер протокола', sortable: 'protocol_number') do |accident|
      link_to accident.protocol_number, admin_accident_path(accident)
    end
    column('Время происшествия', :occured_at)
  end

  filter :protocol_number, label: 'Номер протокола'
  filter :occured_at, label: 'Время происшествия'

  form do |f|
    inputs 'Дорожно-транспортное происшествие' do
      input :protocol_number, label: 'Номер протокола'
      input :occured_at, label: 'Время происшествия', start_year: 1930, end_year: 2030
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

    panel 'Участники' do
      header_action link_to('Добавить', new_admin_accident_accident_participant_path(accident))

      table_for accident.accident_participants do
        column('Водитель') do |participant|
          link_to participant.person.name, admin_person_path(participant.person)
        end
        column('Номер') do |participant|
          link_to participant.vehicle.reg_number, admin_vehicle_path(participant.vehicle)
        end
        column('Модель'){ |participant| participant.vehicle.vehicle_model.name }
        column('Цвет'){ |participant| participant.vehicle.vehicle_color.name }
        column('Год'){ |participant| participant.vehicle.year_of_manufacture }
        column('Владелец') do |participant|
          link_to participant.vehicle.person.name, admin_person_path(participant.vehicle.person)
        end
        column('Действия') do |participant|
          link_to 'удалить', admin_accident_accident_participant_path(accident, participant), method: :delete
        end
      end
    end
  end
end

ActiveAdmin.register AccidentParticipant do
  belongs_to :accident
  actions :new, :create, :destroy

  permit_params :accident_id, :person_id, :vehicle_id

  form do |f|
    inputs 'Участник дорожно-транспортного происшествия' do
      input :person, label: 'Водитель'
      input :vehicle, label: 'Транспортное средство'
    end

    actions do
      action :submit
      cancel_link admin_accident_path(accident)
    end
  end
end

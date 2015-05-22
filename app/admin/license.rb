ActiveAdmin.register License do
  menu label: 'Удостоверения', priority: 2

  permit_params :number, :person_id, :issued_on, :ended_on

  index title: 'Водительские удостоверения' do
    column('Номер') do |license|
      link_to license.number, admin_license_path(license)
    end
    column('Выдано'){ |license| license.person.name }
    column('Дата выдачи'){ |license| license.issued_on }
    column('Дата завершения'){ |license| license.ended_on }
  end

  filter :number, label: 'Номер'
  filter :person, label: 'Выдано'
  filter :issued_on, label: 'Дата выдачи'
  filter :ended_on, label: 'Дата завершения'

  form do |f|
    inputs 'Водительское удостоверение' do
      input :number, label: 'Номер'
      input :person, label: 'Выдано'
      input :issued_on, label: 'Дата выдачи'
      input :ended_on, label: 'Дата завершения'
    end

    actions
  end

  show do
    panel 'Водительское удостоверение' do
      attributes_table_for license do
        row('Номер'){ license.number }
        row('Выдано'){ license.person }
        row('Дата выдачи'){ license.issued_on }
        row('Дата завершения'){ license.ended_on }
      end
    end
  end
end

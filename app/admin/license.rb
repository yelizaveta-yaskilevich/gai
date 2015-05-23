ActiveAdmin.register License do
  menu label: 'Удостоверения', priority: 2

  permit_params :number, :person_id, :issued_on, :ended_on

  index title: 'Водительские удостоверения' do
    column('Номер') do |license|
      link_to license.number, admin_license_path(license)
    end
    column('Гражданин'){ |license| license.person.name }
    column('Действительно с'){ |license| license.issued_on }
    column('Действительно до'){ |license| license.ended_on }
  end

  filter :number, label: 'Номер'
  filter :person, label: 'Гражданин'

  form do |f|
    inputs 'Водительское удостоверение' do
      input :person, label: 'Гражданин'
      input :number, label: 'Номер удостоверения'
      input :issued_on, label: 'Действительно с', start_year: 1930, end_year: 2030
      input :ended_on, label: 'Действительно до', start_year: 1930, end_year: 2030
    end
    actions
  end

  show do
    panel 'Водительское удостоверение' do
      attributes_table_for license do
        row('Гражданин'){ license.person }
        row('Номер удостоверения'){ license.number }
        row('Действительно с'){ license.issued_on }
        row('Действительно до'){ license.ended_on }
      end
    end
  end
end

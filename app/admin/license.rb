ActiveAdmin.register License do
  menu label: 'Удостоверения', priority: 2

  controller do
    def scoped_collection
      super.includes(:vehicle_categories, :person)
    end
  end

  index title: 'Водительские удостоверения' do
    column('Номер', sortable: 'number') do |license|
      link_to license.number, admin_license_path(license)
    end
    column('Категории'){ |license| license.vehicle_categories.order(:id).map(&:name).join(', ') }
    column('Гражданин', sortable: 'people.last_name'){ |license| license.person.name }
    column('Действительно с', :issued_on)
    column('Действительно до', :ended_on)
  end

  filter :number, label: 'Номер'
  filter :person, label: 'Гражданин'

  permit_params :number, :person_id, :issued_on, :ended_on, vehicle_category_ids: []

  form do |f|
    inputs 'Водительское удостоверение' do
      input :person, label: 'Гражданин'
      input :number, label: 'Номер удостоверения'
      input :issued_on, label: 'Действительно с', start_year: 1930, end_year: 2030
      input :ended_on, label: 'Действительно до', start_year: 1930, end_year: 2030
      input :vehicle_categories, label: 'Категории', as: :check_boxes
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
        row('Категории'){ license.vehicle_categories.order(:id).map(&:name).join(', ') }
      end
    end
  end
end

ActiveAdmin.register User do
  menu label: 'Пользователи', parent: 'Система', priority: 6

  permit_params :username, :password, :password_confirmation

  index do
    selectable_column
    column :username
    column :created_at
    actions
  end

  filter :username
  filter :created_at

  show do
    panel 'Пользователь' do
      attributes_table_for user do
        row :username
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    f.inputs 'Пользователь' do
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

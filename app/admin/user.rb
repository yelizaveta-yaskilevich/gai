ActiveAdmin.register User do
  menu false
  actions :all, except: [:destroy]

  filter :username
  filter :created_at

  index title: 'Пользователи' do
    column 'Имя' do |user|
      link_to user.username, admin_user_path(user)
    end
  end

  permit_params :username, :password, :password_confirmation

  form do |f|
    f.inputs 'Пользователь' do
      f.input :username, label: 'Имя'
      f.input :password, label: 'Пароль'
      f.input :password_confirmation, label: 'Подтверждение пароля'
    end
    f.actions
  end

  show do
    panel 'Пользователь' do
      attributes_table_for user do
        row('Имя'){ user.username }
      end
    end
  end
end

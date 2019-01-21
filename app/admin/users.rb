ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :last_name, :role

  index do
    selectable_column
    id_column
    column :name
    column :last_name
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :last_name
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

ActiveAdmin.register Role do
  index :download_links => false do
    column :name
    column :title
    column :description
    default_actions
  end

  form do |f|
    f.inputs "Roles Details" do
      f.input :name, required: true
      f.input :title, required: false
      f.input :description, required: false
    end
    f.actions
  end
end

ActiveAdmin.register User do

  filter :email

  index :download_links => false do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Users Details" do
      f.input :email, required: true
      f.input :password, required: true
      f.input :password_confirmation, required: true
      f.input :role, as: :select, collection: Role.all, required: true
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit :utf8, :authenticity_token, :commit, user: [:email, :password, :password_confirmation, :role_id]
    end
  end

end

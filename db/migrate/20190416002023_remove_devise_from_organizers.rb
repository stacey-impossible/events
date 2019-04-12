class RemoveDeviseFromOrganizers < ActiveRecord::Migration[5.1]
  def change
    remove_index :organizers, :email
    remove_column :organizers, :email
    remove_column :organizers, :encrypted_password
    remove_column :organizers, :remember_created_at
    remove_column :organizers, :sign_in_count
    remove_column :organizers, :current_sign_in_at
    remove_column :organizers, :last_sign_in_at
    remove_column :organizers, :current_sign_in_ip
    remove_column :organizers, :last_sign_in_ip
  end
end

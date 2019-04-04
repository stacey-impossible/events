class AddDeviseToOrganizers < ActiveRecord::Migration[5.1]
  def change
    ## Database authenticatable
    add_column :organizers, :email, :string
    add_column :organizers, :encrypted_password, :string, null: false, default: ""

    ## Rememberable
    add_column :organizers, :remember_created_at, :datetime

    ## Trackable
    add_column :organizers, :sign_in_count, :integer, default: 0, null: false
    add_column :organizers, :current_sign_in_at, :datetime
    add_column :organizers, :last_sign_in_at, :datetime
    add_column :organizers, :current_sign_in_ip, :inet
    add_column :organizers, :last_sign_in_ip, :inet

    add_index :organizers, :email, unique: true
  end
end

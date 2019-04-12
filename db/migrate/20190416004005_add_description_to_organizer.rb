class AddDescriptionToOrganizer < ActiveRecord::Migration[5.1]
  def change
    add_column :organizers, :description, :text
  end
end

class AddCoverToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :cover, :string
  end
end

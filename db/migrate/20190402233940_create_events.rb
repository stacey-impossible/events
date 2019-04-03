class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :city
      t.text   :description
      t.datetime :start_time
      t.string :address
      t.string :link

      t.timestamps
    end
  end
end

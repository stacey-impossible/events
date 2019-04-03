class AddOrganizerRefToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :organizer, foreign_key: true
  end
end

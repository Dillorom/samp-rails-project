class AddAttendingToRsvp < ActiveRecord::Migration[5.2]
  def change
    add_column :rsvps, :attending, :string
    
  end
end

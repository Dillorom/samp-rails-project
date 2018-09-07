class ChangeAttendingInRsvp < ActiveRecord::Migration[5.2]
  def change
    change_column :rsvps, :attending, :boolean
  end
end

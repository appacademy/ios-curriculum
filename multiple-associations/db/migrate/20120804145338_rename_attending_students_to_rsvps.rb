class RenameAttendingStudentsToRsvps < ActiveRecord::Migration
  def change
    rename_table :attending_students, :rsvps
  end
end

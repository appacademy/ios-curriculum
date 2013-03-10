class CreateAttendingStudents < ActiveRecord::Migration
  def change
    create_table :attending_students do |t|
      t.integer :event_id
      t.integer :student_id

      t.timestamps
    end
  end
end

class CreateDiaryEntries < ActiveRecord::Migration
  def change
    create_table :diary_entries do |t|
      t.integer :user_id

      t.string :title

      t.timestamps
    end
  end
end

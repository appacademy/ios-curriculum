class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.string :title
      t.text :body
      
      t.integer :restaurant_id
      
      t.timestamps
    end
  end
end

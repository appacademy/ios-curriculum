class CreateGreetingsTable < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.string "from"
      t.string "to"
      t.string "msg"
    end
  end
end

class CreateApnsTokens < ActiveRecord::Migration
  def change
    create_table :apns_tokens do |t|
      t.string :token

      t.timestamps
    end
  end
end

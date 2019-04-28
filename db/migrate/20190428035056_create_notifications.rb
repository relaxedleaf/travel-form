class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :now_status
      t.integer :previous_status
      t.text :message
      t.timestamps
    end
  end
end

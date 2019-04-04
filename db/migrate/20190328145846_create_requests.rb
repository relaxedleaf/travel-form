class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :department_id
      t.integer :trip_id
      t.timestamps
      t.decimal :amount, precision:8, scale:2
    end
  end
end

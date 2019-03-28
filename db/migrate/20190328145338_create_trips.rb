class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :purpose
      t.string :date_start
      t.string :date_end
      t.integer :employee_id

      t.timestamps
    end
  end
end

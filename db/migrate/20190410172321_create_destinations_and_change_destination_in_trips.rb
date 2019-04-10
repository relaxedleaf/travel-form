class CreateDestinationsAndChangeDestinationInTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.integer :trip_id
      t.string :country
      t.string :state
      t.string :city
      t.timestamps
    end
  end
end

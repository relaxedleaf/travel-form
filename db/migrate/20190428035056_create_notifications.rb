class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :status_id
      t.integer :trip_id
      t.string :form
      t.integer :reimbursement_form_id
      t.integer :authorization_form_id
      t.timestamps
    end
  end
end

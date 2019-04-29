class CreateReimbursementForms < ActiveRecord::Migration[5.1]
  def change
    create_table :reimbursement_forms do |t|
      t.integer :status_id
      t.integer :employee_id
      t.integer :trip_id

      t.timestamps
    end
  end
end

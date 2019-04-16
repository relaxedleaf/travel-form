class CreateReceiptsRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts_requests do |t|
      t.decimal :total_amount, precision:8, scale:2
      t.integer :department_id
      t.integer :reimbursement_form_id

      t.timestamps
    end
  end
end

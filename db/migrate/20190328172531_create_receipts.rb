class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :image
      t.string :location
      t.decimal :cost, precision:8, scale:2
      t.string :receipt_date
      t.integer :expense_type_id
      t.integer :receipts_request_id
      t.integer :reimbursement_form_id

      t.timestamps
    end
  end
end

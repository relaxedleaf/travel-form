class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :image
      t.integer :reimbursement_form_id
      t.string :location
      t.decimal :cost, precision:8, scale:2
      t.string :receipt_date
      t.integer :expense_type_id

      t.timestamps
    end
  end
end

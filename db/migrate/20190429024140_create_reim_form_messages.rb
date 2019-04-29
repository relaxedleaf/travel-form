class CreateReimFormMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :reim_form_messages do |t|
      t.integer :reimbursement_form_id
      t.text :message
      t.integer :status_id
      t.integer :employee_id
      t.timestamps
    end
  end
end

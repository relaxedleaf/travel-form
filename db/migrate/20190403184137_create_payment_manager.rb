class CreatePaymentManager < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_managers do |t|
      t.integer :employee_ssn

      t.timestamps
    end
  end
end

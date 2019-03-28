class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :authorization_form_id
      t.decimal :amount
      t.string :department_id

      t.timestamps
    end
  end
end

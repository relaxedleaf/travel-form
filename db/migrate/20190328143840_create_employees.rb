class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :department_id
      t.string :email
      t.string :fname
      t.string :lname
      t.integer :ssn
      t.string :bdate
      t.intege :manager_ssn

      t.timestamps
    end
  end
end

class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.decimal :total_budget
      t.integer :manager_ssn

      t.timestamps
    end
  end
end

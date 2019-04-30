class CreateAdministrator < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.integer :employee_ssn

      t.timestamps
    end
  end
end

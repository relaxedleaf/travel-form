class AddHoldBudgetToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :budget_hold, :decimal
  end
end

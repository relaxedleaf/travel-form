class ChangeDepartmentTypeInRequest < ActiveRecord::Migration[5.1]
  def change
    change_column :requests, :department_id, :integer
  end
end
class AddEmployeeIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :employee_id, :integer
    add_foreign_key :users, :employees, column: :employee_id
  end
end

class AddForeignKeyToEmployees < ActiveRecord::Migration[7.0]
  def change
   add_foreign_key :employees, :employees, column: :manager_id
  end
end

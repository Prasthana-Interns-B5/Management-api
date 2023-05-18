class AddRefToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :manager, foreign_key: { to_table: :employees }
  end
end

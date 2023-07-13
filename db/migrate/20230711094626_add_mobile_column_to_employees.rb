class AddMobileColumnToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :mobile_number, :integer
  end
end

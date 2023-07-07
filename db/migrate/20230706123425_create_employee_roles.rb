class CreateEmployeeRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_roles do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.integer :assigned_to
      t.string :role_name

      t.timestamps
    end
  end
end

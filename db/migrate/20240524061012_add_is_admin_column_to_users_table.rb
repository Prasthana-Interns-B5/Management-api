class AddIsAdminColumnToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :employees, :active, :boolean, default: true
    add_column :users, :active, :boolean, default: true
    # remove_column :users, :role
  end
end

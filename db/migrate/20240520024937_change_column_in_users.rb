class ChangeColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role
    add_column :users, :role, :string, array: true
  end
end

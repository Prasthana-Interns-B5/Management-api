class ChangeColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role
    add_column :users, :role, :string
    add_column :users, :mobile_number, :string
  end
end

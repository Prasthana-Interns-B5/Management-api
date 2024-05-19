class RemoveDeviseConfigFromEmployee < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :encrypted_password, :string
    remove_column :employees, :reset_password_token, :string
    remove_column :employees, :reset_password_sent_at, :datetime
    remove_column :employees, :remember_created_at, :datetime
    remove_column :employees, :jti, :string
  end
end

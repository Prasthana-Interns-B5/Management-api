class RenameRoleToDesignation < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees , :role, :designation
  end
end

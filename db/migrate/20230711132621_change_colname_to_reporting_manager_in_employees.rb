class ChangeColnameToReportingManagerInEmployees < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :manager_id, :reporting_manager_id
  end
end

class RenameColumnInFeedback < ActiveRecord::Migration[7.0]
  def change
    rename_column :feedbacks ,:manager_id,:subordinate_id
  end
end

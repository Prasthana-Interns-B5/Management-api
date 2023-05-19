class RenameColumnSubOrdinateInFeedback < ActiveRecord::Migration[7.0]
  def change
    rename_column :feedbacks ,:subordinate_id , :manager_id
    rename_column :feedbacks, :review, :self_feedback
  end
end

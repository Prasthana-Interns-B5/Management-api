class RemoveColumnFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :manager_id, :integer
  end
end

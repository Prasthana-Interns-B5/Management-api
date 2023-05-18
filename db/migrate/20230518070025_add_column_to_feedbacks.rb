class AddColumnToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :manager_id, :integer
  end
end

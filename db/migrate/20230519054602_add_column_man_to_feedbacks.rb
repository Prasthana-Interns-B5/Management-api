class AddColumnManToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :manager_feedback, :string
  end
end

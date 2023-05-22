class RemoveColumnFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :One_on_One, :boolean
  end
end

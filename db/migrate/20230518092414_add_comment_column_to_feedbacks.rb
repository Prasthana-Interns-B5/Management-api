class AddCommentColumnToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :comments, :string
  end
end

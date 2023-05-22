class AddColumnOneOneToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :meeting, :boolean , default: false
  end
end

class AddColumnToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :before, :boolean ,default: false
  end
end

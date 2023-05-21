class AddColumnToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedbacks, :employee, null: false, foreign_key: true
  end
end

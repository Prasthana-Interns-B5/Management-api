class DropTablesFeedbackPoints < ActiveRecord::Migration[7.0]
  def change
    drop_table :feedbacks
    drop_table :points
  end
end

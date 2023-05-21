class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :self_feedback
      t.string :month
      t.integer :manager_id
      t.string :manager_feedback
      t.string :comments
      t.boolean :feedback_submitted

      t.timestamps
    end
  end
end

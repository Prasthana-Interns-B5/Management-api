class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.text :employee_feedback
      t.string :feedback_type
      t.references :employee, null: false, foreign_key: true
      t.boolean :flag, default: false
      t.timestamps
    end
  end
end

class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :self_feedback
      t.string :month
      t.string :manager_feedback
      t.integer :manager_id
      t.string :comments
      t.boolean :before
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end

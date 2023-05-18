class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :review
      t.string :month
      t.references :employee, null: false, foreign_key: true
      t.references  :manager ,foreign_key: { to_table: :feedbacks}

      t.timestamps
    end
  end
end

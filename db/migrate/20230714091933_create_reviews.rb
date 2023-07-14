class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :one_on_one, null: false, foreign_key: true
      t.string :review_type
      t.text :manager_review
      t.boolean :flag, default: false
      t.timestamps
    end
  end
end

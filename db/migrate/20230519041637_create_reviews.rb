class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :feedback
      t.string :month
      t.boolean :before
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end

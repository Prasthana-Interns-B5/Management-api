class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end

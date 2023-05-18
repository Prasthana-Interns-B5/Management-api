class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :query
      t.references :employee, null: false, foreign_key: true
      t.boolean :clarified
      t.text :remarks

      t.timestamps
    end
  end
end

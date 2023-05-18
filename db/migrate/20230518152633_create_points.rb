class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :score
      t.string :month
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end

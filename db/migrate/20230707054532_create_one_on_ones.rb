class CreateOneOnOnes < ActiveRecord::Migration[7.0]
  def change
    create_table :one_on_ones do |t|
      t.string :team
      t.date :date
      t.time :time
      t.boolean :repeat_monthly
      t.text :notes

      t.timestamps
    end
  end
end

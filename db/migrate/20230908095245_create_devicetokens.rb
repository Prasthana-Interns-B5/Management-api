class CreateDevicetokens < ActiveRecord::Migration[7.0]
  def change
    create_table :device_tokens do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :token
      t.string :device_type

      t.timestamps
    end
  end
end

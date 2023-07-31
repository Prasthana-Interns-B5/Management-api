class CreateDeviceTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :device_tokens do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end

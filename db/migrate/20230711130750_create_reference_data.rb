class CreateReferenceData < ActiveRecord::Migration[7.0]
  def change
    create_table :reference_data do |t|
      t.string :data_type
      t.string :key 
      t.string :label

      t.timestamps
    end
  end
end

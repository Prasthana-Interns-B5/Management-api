# frozen_string_literal: true

class CreateEmployeePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_points do |t|
      t.string :self_score
      t.string :month
      t.references :employee, null: false, foreign_key: true
      t.integer :manager_id
      t.float :manager_score

      t.timestamps
    end
  end
end

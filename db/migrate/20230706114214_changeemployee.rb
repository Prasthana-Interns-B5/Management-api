# frozen_string_literal: true

class Changeemployee < ActiveRecord::Migration[7.0]
  def change
    change_table :employees do |t|
      t.remove :manager_id, :manager_name, :role
    end
  end
end

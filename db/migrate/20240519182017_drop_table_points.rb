# frozen_string_literal: true

class DropTablePoints < ActiveRecord::Migration[7.0]
  def change
    drop_table :points
  end
end

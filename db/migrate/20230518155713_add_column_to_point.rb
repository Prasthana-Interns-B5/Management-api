# frozen_string_literal: true

class AddColumnToPoint < ActiveRecord::Migration[7.0]
  def change
    add_column :points, :manager_id, :integer
  end
end

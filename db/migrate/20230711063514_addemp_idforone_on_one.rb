# frozen_string_literal: true

class AddempIdforoneOnOne < ActiveRecord::Migration[7.0]
  def change
    add_column :one_on_ones, :employee_id, :integer
  end
end

# frozen_string_literal: true

class AddColumnToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :employee_no, :string
  end
end

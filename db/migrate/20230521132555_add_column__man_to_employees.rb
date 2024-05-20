# frozen_string_literal: true

class AddColumnManToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :manager_name, :string
  end
end

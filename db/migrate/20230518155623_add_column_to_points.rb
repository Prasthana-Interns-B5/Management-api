class AddColumnToPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :points, :manager_score, :string
  end
end

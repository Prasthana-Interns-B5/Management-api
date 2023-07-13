class Changecolname < ActiveRecord::Migration[7.0]
  def change
    rename_column :one_on_ones, :team, :member

  end
end

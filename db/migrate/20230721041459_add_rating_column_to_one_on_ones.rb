class AddRatingColumnToOneOnOnes < ActiveRecord::Migration[7.0]
  def change
    add_column :one_on_ones, :rating, :float
  end
end

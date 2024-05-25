class ChangeDateToOneOnOneTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :one_on_ones, :scheduled_date
    remove_column :one_on_ones, :start_time
    remove_column :one_on_ones, :end_time
    add_column :one_on_ones, :start_date_time, :datetime
    add_column :one_on_ones, :end_date_time, :datetime
  end
end

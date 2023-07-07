class Changedefaultvalue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :one_on_ones, :repeat_monthly, from: nil, to: false
  end
end

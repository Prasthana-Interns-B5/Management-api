class AddColumntoReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews,:manager_id,:integer
    add_column :reviews,:comments ,:string
  end
end

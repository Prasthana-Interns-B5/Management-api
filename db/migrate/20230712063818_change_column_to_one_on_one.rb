# frozen_string_literal: true

class ChangeColumnToOneOnOne < ActiveRecord::Migration[7.0]
  def change
    rename_column :one_on_ones, :member, :member_id
  end
end

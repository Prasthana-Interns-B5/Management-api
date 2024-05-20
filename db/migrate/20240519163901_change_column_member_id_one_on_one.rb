# frozen_string_literal: true

class ChangeColumnMemberIdOneOnOne < ActiveRecord::Migration[7.0]
  def change
    remove_column :one_on_ones, :member_id, :integer
    add_column :one_on_ones, :team_member_id, :integer
  end
end

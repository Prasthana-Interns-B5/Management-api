# frozen_string_literal: true

class ChangeTypeOfMemberId < ActiveRecord::Migration[7.0]
  def change
    change_column :one_on_ones, :member_id, :integer
  end
end

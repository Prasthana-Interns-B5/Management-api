# frozen_string_literal: true

class RenameColumnInPoints < ActiveRecord::Migration[7.0]
  def change
    rename_column :points, :score, :self_score
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

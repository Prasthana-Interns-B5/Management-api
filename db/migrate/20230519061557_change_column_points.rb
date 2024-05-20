# frozen_string_literal: true

class ChangeColumnPoints < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :points do |t|
        dir.up   { t.change :manager_score, :float }
        dir.down { t.change :manager_score, :string }
      end
    end
  end
end

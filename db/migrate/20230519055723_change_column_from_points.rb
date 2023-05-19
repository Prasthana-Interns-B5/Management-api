class ChangeColumnFromPoints < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :points do |t|
        dir.up   { t.change :self_score, :float }
        dir.down { t.change :self_score, :string }
      end
    end
  end
end

# frozen_string_literal: true

class AddColumnManToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :manager_id, :integer
  end
end

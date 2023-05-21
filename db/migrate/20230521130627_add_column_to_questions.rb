class AddColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :anonymous, :boolean
  end
end

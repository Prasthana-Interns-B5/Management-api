class RenameColumnInAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_column :answers, :answer, :reply
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

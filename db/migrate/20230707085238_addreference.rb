class Addreference < ActiveRecord::Migration[7.0]
  def change
    add_reference :employee_roles, :one_on_one
  end
end

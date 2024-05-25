class ChangesToOneOnOneTable < ActiveRecord::Migration[7.0]
  def change
    add_column :one_on_ones, :start_time, :time
    add_column :one_on_ones, :end_time, :time
    rename_column :one_on_ones, :date, :scheduled_date
    rename_column :one_on_ones, :rating, :feedback_rating
    rename_column :one_on_ones, :team_member_id, :participant_id
    remove_column :one_on_ones, :time, :time
    rename_column :one_on_ones, :repeat_monthly, :repeat_type
    change_column :one_on_ones, :repeat_type, :string
    change_column_default :one_on_ones, :status, from: nil, to: 'ms_pending_approval'
  end
end

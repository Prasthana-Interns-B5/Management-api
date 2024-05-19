class CreateUserLogins < ActiveRecord::Migration[7.0]
  def change
    create_table :user_logins do |t|
      t.bigint "user_id", null: false
      t.string "email"
      t.string "mobile_number"
      t.string "mobile_auth_code"
      t.string "email_auth_code"
      t.string "login_token"
      t.datetime "mobile_auth_code_sent_at"
      t.datetime "email_auth_code_sent_at"
      t.datetime "mobile_auth_code_verified_at"
      t.datetime "email_auth_code_verified_at"
      t.string "device_name"
      t.string "device_type"
      t.string "mobile_type"
      t.bigint "token_id"
      t.datetime "last_logged_in"
      t.datetime "last_token_refreshed"
      t.string "requester_ip"
      t.string "uid"
      t.string "device_uid"
      t.index ["token_id"], name: "index_user_logins_on_token_id"
      t.index ["uid"], name: "index_user_logins_on_uid"
      t.index ["user_id"], name: "index_user_logins_on_user_id"
      t.foreign_key "users", column: "user_id"
      t.timestamps
    end
  end
end

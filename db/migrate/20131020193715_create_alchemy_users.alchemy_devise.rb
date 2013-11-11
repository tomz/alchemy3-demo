# This migration comes from alchemy_devise (originally 20131015124700)
class CreateAlchemyUsers < ActiveRecord::Migration
  def up
    return if table_exists?(:alchemy_users)
    create_table "alchemy_users" do |t|
      t.string   "firstname"
      t.string   "lastname"
      t.string   "login"
      t.string   "email"
      t.string   "gender"
      t.string   "alchemy_roles",                              default: "member"
      t.string   "language"
      t.string   "encrypted_password",     limit: 128, default: "",       null: false
      t.string   "password_salt",          limit: 128, default: "",       null: false
      t.integer  "sign_in_count",                      default: 0,        null: false
      t.integer  "failed_attempts",                    default: 0,        null: false
      t.datetime "last_request_at"
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at",                                            null: false
      t.datetime "updated_at",                                            null: false
      t.integer  "creator_id"
      t.integer  "updater_id"
      t.text     "cached_tag_list"
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
    end

    add_index "alchemy_users", ["email"], name: "index_alchemy_users_on_email", unique: true
    add_index "alchemy_users", ["login"], name: "index_alchemy_users_on_login", unique: true
    add_index "alchemy_users", ["reset_password_token"], name: "index_alchemy_users_on_reset_password_token", unique: true
    add_index "alchemy_users", ["alchemy_roles"], name: "index_alchemy_users_on_alchemy_roles"
  end
end

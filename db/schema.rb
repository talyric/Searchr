# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100207034424) do

  create_table "capabilities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deployments", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.string   "status",     :default => "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "deployment_id"
  end

  add_index "team_members", ["deployment_id"], :name => "index_team_members_on_deployment_id"
  add_index "team_members", ["user_id"], :name => "index_team_members_on_user_id"

  create_table "user_capabilities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "capability_id"
    t.date     "cert_expiration"
  end

  add_index "user_capabilities", ["capability_id"], :name => "index_user_capabilities_on_capability_id"
  add_index "user_capabilities", ["user_id"], :name => "index_user_capabilities_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.string   "other_info_1"
    t.string   "other_info_2"
    t.string   "other_info_3"
    t.string   "address_state"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end

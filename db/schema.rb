# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120124131522) do

  create_table "apply_tos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_definations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "callgroups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.integer  "region_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "company"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "attn"
    t.string   "sending_method"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.string   "client_number"
    t.string   "tax_number"
    t.string   "coc"
    t.string   "bank_account"
    t.string   "extensions"
    t.string   "account_code"
    t.integer  "apply_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers_extensions", :id => false, :force => true do |t|
    t.integer  "customer_id"
    t.integer  "extension_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extension_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "extension_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extensions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "valid_from"
    t.date     "valid_to"
  end

  create_table "group_privileges", :force => true do |t|
    t.integer  "group_id"
    t.integer  "privilege_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefixes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privilege_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "privilege_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seller_rates", :force => true do |t|
    t.integer  "country_id"
    t.integer  "apply_to_id"
    t.integer  "region_id"
    t.string   "prefix"
    t.string   "callgroup"
    t.string   "start_rate",         :default => "0"
    t.integer  "call_defination_id"
    t.string   "rate_per_minute",    :default => "1"
    t.string   "end_rate",           :default => "0"
    t.string   "call_per_second",    :default => "1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "valid_from"
    t.date     "valid_to"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :null => false
    t.string   "encrypted_password",     :limit => 128,                :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_code"
    t.integer  "customer_id"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

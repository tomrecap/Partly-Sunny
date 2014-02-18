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

ActiveRecord::Schema.define(:version => 20140218224846) do

  create_table "cities", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorite_city_links", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "city_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorite_city_links", ["user_id", "city_id"], :name => "index_favorite_city_links_on_user_id_and_city_id", :unique => true
  add_index "favorite_city_links", ["user_id"], :name => "index_favorite_city_links_on_user_id"

  create_table "favorite_user_links", :force => true do |t|
    t.integer  "favoriter_id", :null => false
    t.integer  "favorited_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "favorite_user_links", ["favoriter_id", "favorited_id"], :name => "index_favorite_user_links_on_favoriter_id_and_favorited_id", :unique => true
  add_index "favorite_user_links", ["favoriter_id"], :name => "index_favorite_user_links_on_favoriter_id"

  create_table "users", :force => true do |t|
    t.string   "user_name",                                             :null => false
    t.string   "email",                                                 :null => false
    t.string   "password_digest",                                       :null => false
    t.string   "bio",                 :limit => 140
    t.string   "session_token",                                         :null => false
    t.boolean  "activated",                          :default => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "home_city_id",                                          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

  create_table "weather_conditions", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "weather_reports", :force => true do |t|
    t.integer  "temperature",          :null => false
    t.integer  "city_id",              :null => false
    t.integer  "weather_condition_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "weather_reports", ["city_id"], :name => "index_weather_reports_on_city_id"

end

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

ActiveRecord::Schema.define(:version => 20140225194413) do

  create_table "cities", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "body",       :null => false
    t.integer  "photo_id",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["photo_id"], :name => "index_comments_on_photo_id"

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

  create_table "favorite_zip_code_links", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "zip_code_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "favorite_zip_code_links", ["user_id", "zip_code_id"], :name => "index_favorite_zip_code_links_on_user_id_and_zip_code_id", :unique => true
  add_index "favorite_zip_code_links", ["user_id"], :name => "index_favorite_zip_code_links_on_user_id"

  create_table "photo_taggings", :force => true do |t|
    t.integer  "photo_id",   :null => false
    t.integer  "tag_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photo_taggings", ["photo_id", "tag_id"], :name => "index_photo_taggings_on_photo_id_and_tag_id"
  add_index "photo_taggings", ["photo_id"], :name => "index_photo_taggings_on_photo_id"
  add_index "photo_taggings", ["tag_id"], :name => "index_photo_taggings_on_tag_id"

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.integer  "submitter_id",       :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "zip_code_id"
  end

  add_index "photos", ["submitter_id"], :name => "index_photos_on_submitter_id"

  create_table "tags", :force => true do |t|
    t.string   "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_name",                                             :null => false
    t.string   "email"
    t.string   "password_digest",                                       :null => false
    t.string   "bio",                 :limit => 140
    t.string   "session_token",                                         :null => false
    t.boolean  "activated",                          :default => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "uid"
    t.boolean  "celsius",                            :default => false, :null => false
    t.integer  "home_zip_code_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

  create_table "weather_conditions", :force => true do |t|
    t.string   "description",       :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "weather_reports", :force => true do |t|
    t.integer  "temperature",          :null => false
    t.integer  "weather_condition_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "zip_code_id"
  end

  create_table "zip_codes", :force => true do |t|
    t.string   "zip_code",   :null => false
    t.string   "city",       :null => false
    t.string   "state_name", :null => false
    t.string   "state_code", :null => false
    t.float    "longitude",  :null => false
    t.float    "latitude",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "zip_codes", ["city"], :name => "index_zip_codes_on_city"
  add_index "zip_codes", ["latitude"], :name => "index_zip_codes_on_latitude"
  add_index "zip_codes", ["longitude"], :name => "index_zip_codes_on_longitude"
  add_index "zip_codes", ["zip_code"], :name => "index_zip_codes_on_zip_code", :unique => true

end

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

ActiveRecord::Schema.define(:version => 20111129034729) do

  create_table "addesfs", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "esf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addesfs", ["esf_id"], :name => "index_addesfs_on_esf_id"
  add_index "addesfs", ["resource_id"], :name => "index_addesfs_on_resource_id"

  create_table "capabilities", :force => true do |t|
    t.integer  "resource_id"
    t.string   "capability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capabilities", ["resource_id"], :name => "index_capabilities_on_resource_id"

  create_table "companies", :force => true do |t|
    t.string   "username"
    t.string   "headquarters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costperitems", :force => true do |t|
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "esfs", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "governmentagencies", :force => true do |t|
    t.string   "username"
    t.string   "jurisdiction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidents", :force => true do |t|
    t.datetime "this_date"
    t.string   "description"
    t.float    "lat"
    t.float    "lon"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "municipalities", :force => true do |t|
    t.string   "username"
    t.integer  "population"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "incident_id"
    t.integer  "resource_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["incident_id"], :name => "index_requests_on_incident_id"
  add_index "requests", ["resource_id"], :name => "index_requests_on_resource_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "cost"
    t.float    "lat"
    t.float    "lon"
    t.integer  "user_id"
    t.integer  "esf_id"
    t.integer  "costperitem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["costperitem_id"], :name => "index_resources_on_costperitem_id"
  add_index "resources", ["esf_id"], :name => "index_resources_on_esf_id"
  add_index "resources", ["user_id"], :name => "index_resources_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.string   "usertype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

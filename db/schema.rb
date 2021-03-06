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

ActiveRecord::Schema.define(:version => 20120819182031) do

  create_table "channels", :force => true do |t|
    t.string   "channelIdn"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "channelName"
    t.boolean  "enabled",     :default => true
  end

  create_table "points", :force => true do |t|
    t.float    "x"
    t.float    "y"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "triton_session_id"
    t.integer  "channel_id"
  end

  create_table "triton_sessions", :force => true do |t|
    t.date     "dateStart"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
  end

end

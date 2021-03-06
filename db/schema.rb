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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140619164813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accountable_id"
    t.string   "accountable_type"
    t.string   "location"
    t.text     "about"
    t.boolean  "active"
  end

  create_table "favorite_schools", force: true do |t|
    t.integer "player_id"
    t.integer "school_id"
  end

  create_table "notifications", force: true do |t|
    t.integer  "account_id"
    t.integer  "notifieable_id"
    t.string   "notifieable_type"
    t.string   "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_stats", force: true do |t|
    t.integer "player_id"
    t.integer "stat_id"
    t.integer "value"
  end

  create_table "players", force: true do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "players_positions", force: true do |t|
    t.integer  "player_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "position_needs", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position_id"
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
    t.integer  "sport_id"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "web_url"
  end

  create_table "sports", force: true do |t|
    t.string  "name"
    t.boolean "male",   default: true
    t.boolean "female", default: true
  end

  create_table "stats", force: true do |t|
    t.integer "sport_id"
    t.string  "name"
  end

  create_table "videos", force: true do |t|
    t.integer "player_id"
    t.string  "title"
    t.string  "panda_video_id"
  end

end

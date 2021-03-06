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

ActiveRecord::Schema.define(version: 20131221153819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: true do |t|
    t.decimal  "waist",       precision: 5, scale: 3
    t.decimal  "front_rise",  precision: 5, scale: 3
    t.decimal  "thigh",       precision: 5, scale: 3
    t.decimal  "knee",        precision: 5, scale: 3
    t.decimal  "leg_opening", precision: 5, scale: 3
    t.decimal  "inseam",      precision: 5, scale: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tag_size"
    t.integer  "model_id"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "fabric_origin"
    t.string   "made_in"
    t.decimal  "price"
    t.decimal  "denim_weight"
    t.string   "color"
    t.string   "fit"
    t.boolean  "sanforized"
    t.boolean  "stretch"
    t.boolean  "selvedge"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

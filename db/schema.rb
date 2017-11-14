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

ActiveRecord::Schema.define(version: 20171114055319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "committee_memberships", force: :cascade do |t|
    t.bigint "committee_id"
    t.bigint "legislator_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["committee_id"], name: "index_committee_memberships_on_committee_id"
    t.index ["legislator_id"], name: "index_committee_memberships_on_legislator_id"
  end

  create_table "committees", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.string "chamber"
    t.string "code"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_committees_on_code"
    t.index ["parent_id"], name: "index_committees_on_parent_id"
  end

  create_table "legislators", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "bioguide_id"
    t.string "state"
    t.string "district"
    t.string "chamber"
    t.datetime "next_update", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bioguide_id"], name: "index_legislators_on_bioguide_id", unique: true
    t.index ["district"], name: "index_legislators_on_district"
    t.index ["state"], name: "index_legislators_on_state"
  end

  add_foreign_key "committee_memberships", "committees"
  add_foreign_key "committee_memberships", "legislators"
end

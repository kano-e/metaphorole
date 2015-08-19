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

ActiveRecord::Schema.define(version: 20150815090127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "attack_point",  default: 0, null: false
    t.integer  "defence_point", default: 0, null: false
    t.integer  "heal_point",    default: 0, null: false
    t.integer  "enchant_point", default: 0, null: false
  end

  add_index "abilities", ["user_id"], name: "index_abilities_on_user_id", using: :btree

  create_table "skill_set_items", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "skill_set_id"
    t.integer  "skill_id"
    t.integer  "number"
  end

  add_index "skill_set_items", ["skill_id"], name: "index_skill_set_items_on_skill_id", using: :btree
  add_index "skill_set_items", ["skill_set_id"], name: "index_skill_set_items_on_skill_set_id", using: :btree

  create_table "skill_sets", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "created_by_id"
    t.integer  "attack_point",  default: 0, null: false
    t.integer  "defence_point", default: 0, null: false
    t.integer  "heal_point",    default: 0, null: false
    t.integer  "enchant_point", default: 0, null: false
  end

  add_index "skill_sets", ["created_by_id"], name: "index_skill_sets_on_created_by_id", using: :btree
  add_index "skill_sets", ["user_id"], name: "index_skill_sets_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "attack_point",  default: 0, null: false
    t.integer  "defence_point", default: 0, null: false
    t.integer  "heal_point",    default: 0, null: false
    t.integer  "enchant_point", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "abilities", "users"
  add_foreign_key "skill_set_items", "skill_sets"
  add_foreign_key "skill_set_items", "skills"
  add_foreign_key "skill_sets", "users"
end

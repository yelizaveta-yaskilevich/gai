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

ActiveRecord::Schema.define(version: 11) do

  create_table "accident_participants", force: :cascade do |t|
    t.integer "accident_id", limit: 4, null: false
    t.integer "person_id",   limit: 4, null: false
    t.integer "vehicle_id",  limit: 4, null: false
  end

  add_index "accident_participants", ["accident_id", "person_id"], name: "index_accident_participants_on_accident_id_and_person_id", unique: true, using: :btree
  add_index "accident_participants", ["accident_id", "vehicle_id"], name: "index_accident_participants_on_accident_id_and_vehicle_id", unique: true, using: :btree
  add_index "accident_participants", ["accident_id"], name: "index_accident_participants_on_accident_id", using: :btree
  add_index "accident_participants", ["person_id"], name: "index_accident_participants_on_person_id", using: :btree
  add_index "accident_participants", ["vehicle_id"], name: "index_accident_participants_on_vehicle_id", using: :btree

  create_table "accidents", force: :cascade do |t|
    t.datetime "occured_at",                    null: false
    t.string   "protocol_number", limit: 255,   null: false
    t.text     "notes",           limit: 65535
  end

  add_index "accidents", ["protocol_number"], name: "index_accidents_on_protocol_number", unique: true, using: :btree

  create_table "license_vehicle_categories", force: :cascade do |t|
    t.integer "license_id",          limit: 4, null: false
    t.integer "vehicle_category_id", limit: 4, null: false
  end

  add_index "license_vehicle_categories", ["license_id", "vehicle_category_id"], name: "index_license_vehicle_categories_uniq", unique: true, using: :btree
  add_index "license_vehicle_categories", ["license_id"], name: "index_license_vehicle_categories_on_license_id", using: :btree
  add_index "license_vehicle_categories", ["vehicle_category_id"], name: "index_license_vehicle_categories_on_vehicle_category_id", using: :btree

  create_table "licenses", force: :cascade do |t|
    t.string  "number",    limit: 10, null: false
    t.integer "person_id", limit: 4,  null: false
    t.date    "issued_on",            null: false
    t.date    "ended_on",             null: false
  end

  add_index "licenses", ["number"], name: "index_licenses_on_number", unique: true, using: :btree
  add_index "licenses", ["person_id"], name: "index_licenses_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string "first_name",         limit: 255, null: false
    t.string "middle_name",        limit: 255, null: false
    t.string "last_name",          limit: 255, null: false
    t.string "passport_number",    limit: 12,  null: false
    t.string "passport_issued_by", limit: 255, null: false
    t.date   "passport_issued_on",             null: false
    t.string "address_region",     limit: 255, null: false
    t.string "address_area",       limit: 255, null: false
    t.string "address_city",       limit: 255, null: false
    t.string "address_street",     limit: 255, null: false
    t.string "address_house",      limit: 255
    t.string "address_flat",       limit: 255
  end

  add_index "people", ["passport_number"], name: "index_people_on_passport_number", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 255, null: false
    t.string   "encrypted_password",  limit: 255, null: false
    t.datetime "remember_created_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vehicle_categories", force: :cascade do |t|
    t.string "name",        limit: 255,   null: false
    t.text   "description", limit: 65535
  end

  add_index "vehicle_categories", ["name"], name: "index_vehicle_categories_on_name", unique: true, using: :btree

  create_table "vehicle_colors", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  add_index "vehicle_colors", ["name"], name: "index_vehicle_colors_on_name", unique: true, using: :btree

  create_table "vehicle_models", force: :cascade do |t|
    t.integer "vehicle_category_id", limit: 4,   null: false
    t.string  "name",                limit: 255
  end

  add_index "vehicle_models", ["name"], name: "index_vehicle_models_on_name", unique: true, using: :btree
  add_index "vehicle_models", ["vehicle_category_id"], name: "index_vehicle_models_on_vehicle_category_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string  "vin",                 limit: 17, null: false
    t.string  "reg_number",          limit: 9,  null: false
    t.date    "reg_issued_on",                  null: false
    t.integer "vehicle_model_id",    limit: 4,  null: false
    t.integer "vehicle_color_id",    limit: 4,  null: false
    t.integer "person_id",           limit: 4,  null: false
    t.integer "year_of_manufacture", limit: 4,  null: false
  end

  add_index "vehicles", ["person_id"], name: "index_vehicles_on_person_id", using: :btree
  add_index "vehicles", ["reg_number"], name: "index_vehicles_on_reg_number", unique: true, using: :btree
  add_index "vehicles", ["vehicle_color_id"], name: "index_vehicles_on_vehicle_color_id", using: :btree
  add_index "vehicles", ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id", using: :btree
  add_index "vehicles", ["vin"], name: "index_vehicles_on_vin", unique: true, using: :btree

  add_foreign_key "accident_participants", "accidents", on_update: :cascade, on_delete: :cascade
  add_foreign_key "accident_participants", "people", on_update: :cascade, on_delete: :cascade
  add_foreign_key "accident_participants", "vehicles", on_update: :cascade, on_delete: :cascade
  add_foreign_key "license_vehicle_categories", "licenses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "license_vehicle_categories", "vehicle_categories", on_update: :cascade, on_delete: :cascade
  add_foreign_key "licenses", "people", on_update: :cascade, on_delete: :cascade
  add_foreign_key "vehicle_models", "vehicle_categories", on_update: :cascade, on_delete: :cascade
  add_foreign_key "vehicles", "people", on_update: :cascade, on_delete: :cascade
  add_foreign_key "vehicles", "vehicle_colors", on_update: :cascade, on_delete: :cascade
  add_foreign_key "vehicles", "vehicle_models", on_update: :cascade, on_delete: :cascade
end

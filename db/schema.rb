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

ActiveRecord::Schema.define(version: 20150521215052) do

  create_table "accident_participants", force: :cascade do |t|
    t.integer  "accident_id"
    t.integer  "person_id"
    t.integer  "vehicle_id"
    t.boolean  "is_driver"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "accident_participants", ["accident_id"], name: "index_accident_participants_on_accident_id"
  add_index "accident_participants", ["person_id"], name: "index_accident_participants_on_person_id"
  add_index "accident_participants", ["vehicle_id"], name: "index_accident_participants_on_vehicle_id"

  create_table "accidents", force: :cascade do |t|
    t.datetime "occured_at"
    t.string   "protocol_number"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "license_vehicle_categories", force: :cascade do |t|
    t.integer  "license_id"
    t.integer  "vehicle_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "license_vehicle_categories", ["license_id"], name: "index_license_vehicle_categories_on_license_id"
  add_index "license_vehicle_categories", ["vehicle_category_id"], name: "index_license_vehicle_categories_on_vehicle_category_id"

  create_table "licenses", force: :cascade do |t|
    t.integer  "person_id"
    t.date     "issued_on"
    t.date     "ended_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "licenses", ["person_id"], name: "index_licenses_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "address_region"
    t.string   "address_area"
    t.string   "address_city"
    t.string   "address_street"
    t.string   "address_house"
    t.string   "address_flat"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            null: false
    t.string   "encrypted_password",  null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "vehicle_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vehicle_colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.integer  "vehicle_category_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vehicle_models", ["vehicle_category_id"], name: "index_vehicle_models_on_vehicle_category_id"

  create_table "vehicles", force: :cascade do |t|
    t.string   "vin",                 limit: 17, null: false
    t.string   "reg_number",          limit: 9,  null: false
    t.date     "reg_issued_on",                  null: false
    t.integer  "vehicle_model_id",               null: false
    t.integer  "vehicle_color_id",               null: false
    t.integer  "person_id",                      null: false
    t.integer  "year_of_manufacture",            null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "vehicles", ["person_id"], name: "index_vehicles_on_person_id"
  add_index "vehicles", ["vehicle_color_id"], name: "index_vehicles_on_vehicle_color_id"
  add_index "vehicles", ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id"

end

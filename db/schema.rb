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

ActiveRecord::Schema.define(version: 20171009102115) do

  create_table "doctors", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "group_id"
    t.string   "name"
    t.string   "image"
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "reviews_count", default: 0
  end

  create_table "doctors_specialties", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "specialty_id"
    t.integer  "doctor_id"
    t.index ["doctor_id"], name: "index_doctors_specialties_on_doctor_id"
    t.index ["specialty_id"], name: "index_doctors_specialties_on_specialty_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "review_id"
    t.integer  "rating"
    t.text     "comment"
    t.integer  "doctor_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "visible",    default: false
    t.integer  "user_id"
    t.index ["doctor_id"], name: "index_reviews_on_doctor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.integer  "specialty_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "ratings_count",   default: 0
  end

end

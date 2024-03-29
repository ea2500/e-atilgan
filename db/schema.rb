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

ActiveRecord::Schema.define(version: 20150801022552) do

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.string   "doc_file"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "lab_id"
    t.binary   "data"
    t.string   "filename"
    t.string   "content_type"
  end

  add_index "documents", ["lab_id"], name: "index_documents_on_lab_id"

  create_table "labs", force: :cascade do |t|
    t.string   "name"
    t.string   "college"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_labs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_labs", ["lab_id"], name: "index_user_labs_on_lab_id"
  add_index "user_labs", ["user_id"], name: "index_user_labs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

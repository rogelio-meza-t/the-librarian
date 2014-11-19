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

ActiveRecord::Schema.define(version: 20141119203454) do

  create_table "authorings", force: true do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "authors", force: true do |t|
    t.string "name", default: "", null: false
  end

  create_table "books", force: true do |t|
    t.string   "title",              null: false
    t.string   "original_title"
    t.string   "translation"
    t.integer  "edition"
    t.date     "edition_date"
    t.string   "edition_place"
    t.integer  "publication_year"
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "editorial_id"
  end

  create_table "editorials", force: true do |t|
    t.string "name", default: "", null: false
  end

  add_index "editorials", ["name"], name: "index_editorials_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0,  null: false
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

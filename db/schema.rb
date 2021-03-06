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

ActiveRecord::Schema.define(version: 20160810105557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consent_gifts", force: :cascade do |t|
    t.integer  "dp_version_id"
    t.integer  "data_journal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "consent_gifts", ["data_journal_id"], name: "index_consent_gifts_on_data_journal_id", using: :btree
  add_index "consent_gifts", ["dp_version_id"], name: "index_consent_gifts_on_dp_version_id", using: :btree

  create_table "consent_withdrawals", force: :cascade do |t|
    t.integer  "dp_version_id"
    t.integer  "data_journal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "consent_withdrawals", ["data_journal_id"], name: "index_consent_withdrawals_on_data_journal_id", using: :btree
  add_index "consent_withdrawals", ["dp_version_id"], name: "index_consent_withdrawals_on_dp_version_id", using: :btree

  create_table "data_journals", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "consent_active",                        default: true, null: false
    t.integer  "consent_given_count",                   default: 1,    null: false
    t.datetime "current_consent_given_at"
    t.integer  "consent_withdrawn_count",               default: 0,    null: false
    t.datetime "current_consent_withdrawn_at"
    t.integer  "latest_dp_version_id_consent_given_to"
    t.integer  "data_actions_count",                    default: 0,    null: false
    t.datetime "latest_data_action_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "data_journals", ["user_id"], name: "index_data_journals_on_user_id", using: :btree

  create_table "downloads", force: :cascade do |t|
    t.integer  "data_journal_id"
    t.string   "format"
    t.string   "format_language"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "downloads", ["data_journal_id"], name: "index_downloads_on_data_journal_id", using: :btree

  create_table "dp_versions", force: :cascade do |t|
    t.string   "internal_ref"
    t.text     "content"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string   "name"
    t.string   "move_cat"
    t.integer  "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "label"
  end

  add_index "moves", ["pokemon_id"], name: "index_moves_on_pokemon_id", using: :btree

  create_table "pokemons", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "category"
    t.float    "weight"
    t.float    "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars"
    t.integer  "user_id"
    t.integer  "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["pokemon_id"], name: "index_ratings_on_pokemon_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "data_journal_id"
    t.string   "nature"
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "requests", ["data_journal_id"], name: "index_requests_on_data_journal_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.integer  "data_journal_id"
    t.string   "format"
    t.string   "format_language"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "uploads", ["data_journal_id"], name: "index_uploads_on_data_journal_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.date     "birth_date"
    t.string   "occupation"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "consent_gifts", "data_journals"
  add_foreign_key "consent_gifts", "dp_versions"
  add_foreign_key "consent_withdrawals", "data_journals"
  add_foreign_key "consent_withdrawals", "dp_versions"
  add_foreign_key "data_journals", "users"
  add_foreign_key "downloads", "data_journals"
  add_foreign_key "moves", "pokemons"
  add_foreign_key "ratings", "pokemons"
  add_foreign_key "ratings", "users"
  add_foreign_key "requests", "data_journals"
  add_foreign_key "uploads", "data_journals"
end

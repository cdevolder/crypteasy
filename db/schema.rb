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


ActiveRecord::Schema.define(version: 20171205142936)

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "accronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
  end

  create_table "exchangetimevalues", force: :cascade do |t|
    t.float "euro"
    t.float "dollar"
    t.bigint "platform_id"
    t.bigint "crypto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_exchangetimevalues_on_crypto_id"
    t.index ["platform_id"], name: "index_exchangetimevalues_on_platform_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "crypto_id"
    t.bigint "platform_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_favorites_on_crypto_id"
    t.index ["platform_id"], name: "index_favorites_on_platform_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "rating"
    t.string "fees"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exchangetimevalues", "cryptos"
  add_foreign_key "exchangetimevalues", "platforms"
  add_foreign_key "favorites", "cryptos"
  add_foreign_key "favorites", "platforms"
  add_foreign_key "favorites", "users"
end

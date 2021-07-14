# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_02_122251) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.float "balance"
    t.float "annual_percentage_yield"
    t.float "annual_percentage_rate"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_number"
    t.string "card_type"
    t.string "expiration"
    t.float "annual_percentage_rate"
    t.float "balance"
    t.integer "card_owner_id"
    t.string "card_owner_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchandises", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "owner_id"
    t.string "owner_type"
    t.integer "user_id"
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_merchandises_on_account_id"
    t.index ["user_id"], name: "index_merchandises_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.string "email"
    t.string "telephone_number"
    t.date "birth_date"
    t.string "uid"
    t.string "provider"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

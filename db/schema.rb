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

ActiveRecord::Schema.define(version: 2018_06_06_151505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
  end

  create_table "tones", force: :cascade do |t|
    t.string "tone_name"
    t.index ["tone_name"], name: "index_tones_on_tone_name"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "crypto_id"
    t.bigint "tone_id"
    t.index ["crypto_id"], name: "index_tweets_on_crypto_id"
    t.index ["tone_id"], name: "index_tweets_on_tone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.citext "username"
    t.citext "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "id_token"
  end

  add_foreign_key "tweets", "cryptos"
  add_foreign_key "tweets", "tones"
end

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

ActiveRecord::Schema.define(version: 20161012072847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bencanas", force: :cascade do |t|
    t.string   "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bmkgs", force: :cascade do |t|
    t.date     "tanggal"
    t.float    "suhu_min"
    t.float    "suhu_max"
    t.float    "suhu_rata"
    t.integer  "kelembaban_rata"
    t.float    "curah_hujan"
    t.integer  "lama_penyinaran"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "stasiun_id"
    t.index ["stasiun_id"], name: "index_bmkgs_on_stasiun_id", using: :btree
  end

  create_table "bnpbs", force: :cascade do |t|
    t.date     "tanggal"
    t.integer  "bencana_id"
    t.integer  "kabupaten_id"
    t.integer  "korban_meninggal"
    t.integer  "korban_hilang"
    t.integer  "korban_luka"
    t.integer  "korban_mengungsi"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["bencana_id"], name: "index_bnpbs_on_bencana_id", using: :btree
    t.index ["kabupaten_id"], name: "index_bnpbs_on_kabupaten_id", using: :btree
  end

  create_table "kabupatens", force: :cascade do |t|
    t.string   "nama"
    t.integer  "provinsi_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provinsi_id"], name: "index_kabupatens_on_provinsi_id", using: :btree
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "nama"
    t.integer  "bencana_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bencana_id"], name: "index_keywords_on_bencana_id", using: :btree
  end

  create_table "polas", force: :cascade do |t|
    t.integer  "bnpb_id"
    t.integer  "h1"
    t.integer  "h2"
    t.integer  "h3"
    t.integer  "h4"
    t.integer  "h5"
    t.integer  "h6"
    t.integer  "h7"
    t.integer  "polanya"
    t.integer  "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bnpb_id"], name: "index_polas_on_bnpb_id", using: :btree
  end

  create_table "polds", force: :cascade do |t|
    t.integer  "h1"
    t.integer  "h2"
    t.integer  "h3"
    t.integer  "h4"
    t.integer  "h5"
    t.integer  "h6"
    t.integer  "h7"
    t.integer  "pola"
    t.integer  "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinsis", force: :cascade do |t|
    t.string   "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sosialmedias", force: :cascade do |t|
    t.date     "tanggal"
    t.string   "link"
    t.integer  "bencana_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bencana_id"], name: "index_sosialmedias_on_bencana_id", using: :btree
  end

  create_table "stasiuns", force: :cascade do |t|
    t.string   "nama"
    t.integer  "provinsi_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provinsi_id"], name: "index_stasiuns_on_provinsi_id", using: :btree
  end

  create_table "twitters", force: :cascade do |t|
    t.date     "tanggal"
    t.text     "post"
    t.integer  "bencana_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bencana_id"], name: "index_twitters_on_bencana_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bmkgs", "stasiuns"
  add_foreign_key "bnpbs", "bencanas"
  add_foreign_key "bnpbs", "kabupatens"
  add_foreign_key "kabupatens", "provinsis"
  add_foreign_key "keywords", "bencanas"
  add_foreign_key "polas", "bnpbs"
  add_foreign_key "sosialmedias", "bencanas"
  add_foreign_key "stasiuns", "provinsis"
  add_foreign_key "twitters", "bencanas"
end

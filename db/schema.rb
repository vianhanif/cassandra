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

ActiveRecord::Schema.define(version: 20160922153546) do

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

  add_foreign_key "bnpbs", "bencanas"
  add_foreign_key "bnpbs", "kabupatens"
  add_foreign_key "kabupatens", "provinsis"
  add_foreign_key "sosialmedias", "bencanas"
end

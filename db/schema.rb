# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_22_041520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "agreements", force: :cascade do |t|
    t.bigint "resource_id", null: false
    t.bigint "business_id", null: false
    t.text "terms"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["business_id"], name: "index_agreements_on_business_id"
    t.index ["resource_id"], name: "index_agreements_on_resource_id"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.text "name"
    t.text "url"
    t.text "location"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "house_number"
    t.string "road"
    t.string "suburb"
    t.string "county"
    t.string "state"
    t.integer "postcode"
    t.string "country"
    t.string "country_code"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.text "name"
    t.bigint "business_id", null: false
    t.text "description"
    t.text "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["business_id"], name: "index_resources_on_business_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agreements", "businesses"
  add_foreign_key "agreements", "resources"
  add_foreign_key "agreements", "users"
  add_foreign_key "businesses", "users"
  add_foreign_key "resources", "businesses"
end

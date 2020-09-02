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

ActiveRecord::Schema.define(version: 2020_09_01_101700) do

  create_table "locations", force: :cascade do |t|
    t.string "location"
    t.string "zone"
    t.string "name"
    t.string "dept"
    t.string "subdept"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "businessunit"
  end

  create_table "master_businesses", force: :cascade do |t|
    t.string "business_name"
    t.string "business_unit"
    t.string "import_filename"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "masters", force: :cascade do |t|
    t.string "CountName"
    t.string "StoreCode"
    t.string "StoreName"
    t.string "VenderCode"
    t.string "VenderName"
    t.string "DeptCode"
    t.string "DeptName"
    t.string "SubDeptCode"
    t.string "SubDeptName"
    t.string "Class"
    t.string "ClassName"
    t.string "SubClass"
    t.string "SubClassName"
    t.string "SKUType"
    t.string "SpecialAttribute"
    t.string "SKU"
    t.string "BarcodeIBC"
    t.string "ProductName"
    t.string "Brand"
    t.string "Model"
    t.string "UnitOfMeasure"
    t.decimal "Stock"
    t.decimal "PackSize"
    t.decimal "Cost"
    t.decimal "RetailPrice"
    t.string "Status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "BarcodeSBC"
    t.string "filename"
  end

  create_table "uploaded_documents", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "plain_password"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variances", force: :cascade do |t|
    t.string "BARCODE"
    t.string "LOCATION"
    t.decimal "QUANTITY"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

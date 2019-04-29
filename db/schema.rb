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

ActiveRecord::Schema.define(version: 20190429024140) do

  create_table "authorization_forms", force: :cascade do |t|
    t.integer "status_id"
    t.integer "employee_id"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.decimal "total_budget"
    t.integer "manager_ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "budget_hold"
  end

  create_table "destinations", force: :cascade do |t|
    t.integer "trip_id"
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "department_id"
    t.string "fname"
    t.string "lname"
    t.integer "ssn"
    t.string "bdate"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "status_id"
    t.integer "trip_id"
    t.string "form"
    t.integer "reimbursement_form_id"
    t.integer "authorization_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_managers", force: :cascade do |t|
    t.integer "employee_ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string "image"
    t.string "location"
    t.decimal "cost", precision: 8, scale: 2
    t.string "receipt_date"
    t.integer "expense_type_id"
    t.integer "receipts_request_id"
    t.integer "reimbursement_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts_requests", force: :cascade do |t|
    t.decimal "total_amount", precision: 8, scale: 2
    t.integer "department_id"
    t.integer "status_id"
    t.integer "reimbursement_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reim_form_messages", force: :cascade do |t|
    t.integer "reimbursement_form_id"
    t.text "message"
    t.integer "status_id"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reimbursement_forms", force: :cascade do |t|
    t.integer "status_id"
    t.integer "employee_id"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "department_id"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.integer "status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "purpose"
    t.string "date_start"
    t.string "date_end"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "expense_type_id"
    t.decimal "cost", precision: 8, scale: 2
    t.integer "authorization_form_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

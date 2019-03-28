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

ActiveRecord::Schema.define(version: 20190328172531) do

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
  end

  create_table "employees", force: :cascade do |t|
    t.integer "department_id"
    t.string "email"
    t.string "fname"
    t.string "lname"
    t.integer "ssn"
    t.string "bdate"
    t.integer "manager_ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string "image"
    t.integer "reimbursement_form_id"
    t.string "location"
    t.decimal "cost"
    t.string "receipt_date"
    t.integer "expense_type_id"
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
    t.integer "authorization_form_id"
    t.decimal "amount"
    t.string "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "destination"
    t.string "purpose"
    t.string "date_start"
    t.string "date_end"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "expense_type_id"
    t.decimal "cost"
    t.integer "authorization_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

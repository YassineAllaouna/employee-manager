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

ActiveRecord::Schema[8.0].define(version: 2025_03_22_110014) do
  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "department"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.date "birth_date"
    t.string "gender"
    t.string "nationality"
    t.string "social_number"
    t.string "personal_address"
    t.string "personal_phone"
    t.string "personal_email"
    t.string "emergency_contact"
    t.string "rib"
    t.string "manager"
    t.date "hire_date"
    t.string "contract_type"
    t.string "status"
    t.string "location"
    t.integer "salary"
    t.string "payment_frequency"
    t.text "benefits"
    t.text "performance_reviews"
    t.text "goals"
    t.text "feedback"
    t.text "education"
    t.text "trainings"
    t.text "skills"
    t.text "past_experience"
    t.text "payroll_documents"
    t.integer "leave_balance"
    t.integer "leave_taken"
    t.text "leave_requests"
    t.text "absences"
    t.string "tax_id"
    t.text "diversity_info"
    t.text "system_access_log"
    t.text "permissions"
    t.text "gdpr_compliance"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
  end

  add_foreign_key "employees", "users"
end

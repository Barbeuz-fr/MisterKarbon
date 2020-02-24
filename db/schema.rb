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

ActiveRecord::Schema.define(version: 2020_02_24_164705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ademe_emission_factors", force: :cascade do |t|
    t.string "name"
    t.float "emission_value"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "calculation"
    t.bigint "question_id", null: false
    t.bigint "report_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["report_scope_id"], name: "index_answers_on_report_scope_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emission_modules", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orgas", force: :cascade do |t|
    t.string "name"
    t.string "countries"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_orgas_on_company_id"
  end

  create_table "questions", force: :cascade do |t|
    t.boolean "calculation"
    t.string "content"
    t.bigint "ademe_emission_factor_id", null: false
    t.bigint "emission_module_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ademe_emission_factor_id"], name: "index_questions_on_ademe_emission_factor_id"
    t.index ["emission_module_id"], name: "index_questions_on_emission_module_id"
  end

  create_table "report_scope_orga_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "report_scope_orga_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_scope_orga_id"], name: "index_report_scope_orga_users_on_report_scope_orga_id"
    t.index ["user_id"], name: "index_report_scope_orga_users_on_user_id"
  end

  create_table "report_scope_orgas", force: :cascade do |t|
    t.bigint "orga_id", null: false
    t.bigint "report_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orga_id"], name: "index_report_scope_orgas_on_orga_id"
    t.index ["report_scope_id"], name: "index_report_scope_orgas_on_report_scope_id"
  end

  create_table "report_scopes", force: :cascade do |t|
    t.date "deadline"
    t.string "status"
    t.bigint "report_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "emission_module_id", null: false
    t.index ["emission_module_id"], name: "index_report_scopes_on_emission_module_id"
    t.index ["report_id"], name: "index_report_scopes_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_reports_on_company_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "job_position"
    t.string "organization_position"
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "report_scopes"
  add_foreign_key "orgas", "companies"
  add_foreign_key "questions", "ademe_emission_factors"
  add_foreign_key "questions", "emission_modules"
  add_foreign_key "report_scope_orga_users", "report_scope_orgas"
  add_foreign_key "report_scope_orga_users", "users"
  add_foreign_key "report_scope_orgas", "orgas"
  add_foreign_key "report_scope_orgas", "report_scopes"
  add_foreign_key "report_scopes", "emission_modules"
  add_foreign_key "report_scopes", "reports"
  add_foreign_key "reports", "companies"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "companies"
end

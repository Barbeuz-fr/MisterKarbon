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

ActiveRecord::Schema.define(version: 2020_06_30_185315) do

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

  create_table "activity_data", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "value_1"
    t.float "value_2"
    t.float "amount_spend"
    t.string "amount_unit"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "transport_payment"
    t.string "vehicle_control"
    t.integer "beges_item"
    t.bigint "emission_factor_id"
    t.index ["emission_factor_id"], name: "index_activity_data_on_emission_factor_id"
  end

  create_table "ademe_emission_factors", force: :cascade do |t|
    t.string "name"
    t.float "emission_value"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "id_ademe"
    t.string "nom_base"
    t.integer "count"
  end

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "calculation"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "report_scope_orga_id", null: false
    t.string "unit"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["report_scope_orga_id"], name: "index_answers_on_report_scope_orga_id"
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "header"
    t.string "text"
    t.string "category", default: [], array: true
    t.string "author"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "newsletter"
  end

  create_table "emission_factors", force: :cascade do |t|
    t.string "source"
    t.integer "id_base_carbone"
    t.string "line_type"
    t.string "step"
    t.string "ef_level_1"
    t.string "ef_level_2"
    t.string "ef_level_3"
    t.float "ef_value_total"
    t.float "ef_value_co2"
    t.float "ef_value_ch4"
    t.float "ef_value_n2o"
    t.float "ef_value_co2b"
    t.float "ef_value_other_ges"
    t.integer "ef_uncertainty"
    t.string "ef_unit"
    t.string "data_unit_1"
    t.string "data_unit_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "localization_1"
    t.string "localization_2"
    t.boolean "item_1_fixed_energy"
    t.boolean "item_2_electricity"
    t.boolean "item_3_network"
    t.boolean "item_4_mobile_fuel"
    t.boolean "item_5_transport"
    t.boolean "item_6_business_travel"
    t.boolean "item_7_commuting"
    t.boolean "item_8_client_visits"
    t.boolean "item_9_procurement"
    t.boolean "item_10_amortization"
    t.boolean "item_11_waste_city"
    t.boolean "item_12_waste_private"
    t.boolean "item_13_water"
    t.boolean "item_14_product_use"
    t.boolean "item_15_product_waste"
    t.boolean "item_16_fugitive"
    t.float "ef_value_ch4b"
  end

  create_table "emission_modules", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "scope"
    t.string "general_description"
    t.string "emission_factor_description"
  end

  create_table "orgas", force: :cascade do |t|
    t.string "name"
    t.string "countries"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_orgas_on_company_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
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
    t.string "status"
    t.index ["orga_id"], name: "index_report_scope_orgas_on_orga_id"
    t.index ["report_scope_id"], name: "index_report_scope_orgas_on_report_scope_id"
  end

  create_table "report_scopes", force: :cascade do |t|
    t.date "deadline"
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

  create_table "testorgas", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_data", "emission_factors"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "report_scope_orgas"
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

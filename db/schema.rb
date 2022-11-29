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

ActiveRecord::Schema[7.0].define(version: 2022_11_27_000713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "course_modules", force: :cascade do |t|
    t.integer "position"
    t.string "instanceable_type", null: false
    t.bigint "instanceable_id", null: false
    t.bigint "course_id", null: false
    t.bigint "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_modules_on_course_id"
    t.index ["instanceable_type", "instanceable_id"], name: "index_course_modules_on_instanceable"
    t.index ["section_id"], name: "index_course_modules_on_section_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "visible", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_courses_on_name", unique: true
  end

  create_table "courses_users", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "module_pages", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_module_pages_on_section_id"
  end

  create_table "module_quizzes", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "value", precision: 12, scale: 7, default: "100.0"
    t.decimal "min_value", precision: 12, scale: 7, default: "0.0"
    t.decimal "sum_values", precision: 12, scale: 7, default: "0.0"
    t.bigint "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_module_quizzes_on_section_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.decimal "fraction", precision: 12, scale: 7, default: "0.0"
    t.bigint "quiz_question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_question_id"], name: "index_question_answers_on_quiz_question_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "score", precision: 12, scale: 7, default: "0.0"
    t.integer "position"
    t.integer "question_type", default: 1, null: false
    t.bigint "module_quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["module_quiz_id"], name: "index_quiz_questions_on_module_quiz_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.integer "role", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "course_modules", "courses", on_delete: :cascade
  add_foreign_key "course_modules", "sections", on_delete: :cascade
  add_foreign_key "courses_users", "courses", on_delete: :cascade
  add_foreign_key "courses_users", "users", on_delete: :cascade
  add_foreign_key "module_pages", "sections", on_delete: :cascade
  add_foreign_key "module_quizzes", "sections", on_delete: :cascade
  add_foreign_key "question_answers", "quiz_questions", on_delete: :cascade
  add_foreign_key "quiz_questions", "module_quizzes", on_delete: :cascade
  add_foreign_key "sections", "courses", on_delete: :cascade
end

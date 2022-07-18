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

ActiveRecord::Schema.define(version: 2022_07_18_184412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "question_responses", force: :cascade do |t|
    t.text "answer", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "response_id"
    t.index ["question_id"], name: "index_question_responses_on_question_id"
    t.index ["response_id"], name: "index_question_responses_on_response_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "prompt", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "question_type_id"
    t.index ["form_id"], name: "index_questions_on_form_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "aasm_state"
    t.index ["form_id"], name: "index_responses_on_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_forms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_id"], name: "index_users_forms_on_form_id"
    t.index ["user_id"], name: "index_users_forms_on_user_id"
  end

  add_foreign_key "question_responses", "questions"
  add_foreign_key "questions", "forms"
  add_foreign_key "responses", "forms"
  add_foreign_key "users_forms", "forms"
  add_foreign_key "users_forms", "users"
end

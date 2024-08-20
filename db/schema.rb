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

ActiveRecord::Schema[7.1].define(version: 2024_08_20_054112) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_comments_on_task_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.date "birthdate"
    t.string "allergies"
    t.bigint "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sexe"
    t.index ["family_id"], name: "index_dogs_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "health_tracks", force: :cascade do |t|
    t.integer "weight"
    t.integer "height"
    t.integer "bcs"
    t.date "date"
    t.bigint "dog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exercise"
    t.index ["dog_id"], name: "index_health_tracks_on_dog_id"
  end

  create_table "medical_records", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.string "vet_contact"
    t.bigint "dog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_medical_records_on_dog_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.string "start_time"
    t.string "end_time"
    t.string "location"
    t.text "description"
    t.bigint "dog_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_tasks_on_dog_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "role"
    t.boolean "notifications_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "family_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_id"], name: "index_users_on_family_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "tasks"
  add_foreign_key "comments", "users"
  add_foreign_key "dogs", "families"
  add_foreign_key "health_tracks", "dogs"
  add_foreign_key "medical_records", "dogs"
  add_foreign_key "tasks", "dogs"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "families"
end

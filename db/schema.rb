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

ActiveRecord::Schema[7.0].define(version: 2023_12_17_165817) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.integer "enrollment_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "removed_products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_profiles", force: :cascade do |t|
    t.string "full_name"
    t.text "bio"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_profiles_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname"
    t.integer "age", default: 0
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.check_constraint "age > 0", name: "age_check"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "student_profiles", "students"

  create_view "users_with_addresses", sql_definition: <<-SQL
      SELECT u.id AS user_id,
      u.firstname AS user_name,
      a.street AS address_street,
      a.city AS address_city,
      a.state AS address_state,
      a.zip_code AS address_zip_code
     FROM (users u
       LEFT JOIN addresses a ON ((u.id = a.user_id)));
  SQL
  create_view "users_with_maddresses", sql_definition: <<-SQL
      SELECT u.id AS user_id,
      u.firstname AS user_name,
      a.street AS address_street,
      a.city AS address_city,
      a.state AS address_state,
      a.zip_code AS address_zip_code
     FROM (users u
       LEFT JOIN addresses a ON ((u.id = a.user_id)));
  SQL
  create_trigger("products_after_delete_row_tr", :generated => true, :compatibility => 1).
      on("products").
      after(:delete) do
    "INSERT INTO removed_products (name, created_at, updated_at) VALUES (OLD.name, OLD.created_at, OLD.updated_at);"
  end

end

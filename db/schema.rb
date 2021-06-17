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

ActiveRecord::Schema.define(version: 2021_06_17_083222) do

  create_table "cardwords", force: :cascade do |t|
    t.string "word"
    t.text "description"
    t.integer "response", default: 0
    t.integer "group", default: 0
    t.integer "incorrect_group", default: 0
    t.time "date_change_group", default: "2000-01-01 00:00:00"
    t.boolean "hard_word", default: false
    t.datetime "reviewed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

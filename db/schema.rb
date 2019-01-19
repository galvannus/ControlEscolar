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

ActiveRecord::Schema.define(version: 20190118014901) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.index ["student_id"], name: "index_accounts_on_student_id"
  end

  create_table "debts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number_partial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recordpayments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.decimal "amount", precision: 10
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debt_id"], name: "index_recordpayments_on_debt_id"
    t.index ["user_id"], name: "index_recordpayments_on_user_id"
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "total", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
    t.integer "student_id"
    t.index ["student_id"], name: "index_scores_on_student_id"
    t.index ["subject_id"], name: "index_scores_on_subject_id"
  end

  create_table "semesters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number_semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "group_id"
    t.string "name"
    t.string "lastname"
    t.string "tel1"
    t.string "tel2"
    t.string "street"
    t.string "numberhome"
    t.string "suburb"
    t.string "registrationnumber"
    t.string "banknumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "discount"
    t.integer "subject_id"
    t.integer "semester_id"
    t.index ["account_id"], name: "index_students_on_account_id"
    t.index ["group_id"], name: "index_students_on_group_id"
    t.index ["semester_id"], name: "index_students_on_semester_id"
    t.index ["subject_id"], name: "index_students_on_subject_id"
  end

  create_table "studentsubjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "firstsmodulescore", precision: 10
    t.decimal "secondmodulescore", precision: 10
    t.index ["student_id"], name: "index_studentsubjects_on_student_id"
    t.index ["subject_id"], name: "index_studentsubjects_on_subject_id"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.index ["student_id"], name: "index_subjects_on_student_id"
  end

  create_table "subjectscores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "subject_id"
    t.integer "partial_id"
    t.integer "score_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "firstscore", precision: 10
    t.decimal "secondscore", precision: 10
    t.index ["partial_id"], name: "index_subjectscores_on_partial_id"
    t.index ["score_id"], name: "index_subjectscores_on_score_id"
    t.index ["student_id"], name: "index_subjectscores_on_student_id"
    t.index ["subject_id"], name: "index_subjectscores_on_subject_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "last_name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "studentsubjects", "students"
  add_foreign_key "studentsubjects", "subjects"
end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160615123240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "applications", ["job_id"], name: "index_applications_on_job_id", using: :btree
  add_index "applications", ["user_id"], name: "index_applications_on_user_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "name"
    t.string   "school"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["resume_id"], name: "index_educations_on_resume_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "street"
    t.string   "postcode"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "employers", ["email"], name: "index_employers_on_email", unique: true, using: :btree
  add_index "employers", ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true, using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "job_skills", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_skills", ["job_id"], name: "index_job_skills_on_job_id", using: :btree
  add_index "job_skills", ["skill_id"], name: "index_job_skills_on_skill_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "job_title"
    t.string   "salary"
    t.text     "description"
    t.string   "location"
    t.integer  "employer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "resume_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["resume_id"], name: "index_projects_on_resume_id", using: :btree

  create_table "resume_skills", force: :cascade do |t|
    t.integer  "resume_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resume_skills", ["resume_id"], name: "index_resume_skills_on_resume_id", using: :btree
  add_index "resume_skills", ["skill_id"], name: "index_resume_skills_on_skill_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "phone"
    t.text     "summary"
    t.string   "linkedin"
    t.integer  "years_of_experience"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "employer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["employer_id"], name: "index_reviews_on_employer_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_experiences", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "company_name"
    t.string   "job_title"
    t.text     "description"
    t.integer  "resume_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "work_experiences", ["resume_id"], name: "index_work_experiences_on_resume_id", using: :btree

  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "users"
  add_foreign_key "educations", "resumes"
  add_foreign_key "identities", "users"
  add_foreign_key "job_skills", "jobs"
  add_foreign_key "job_skills", "skills"
  add_foreign_key "jobs", "employers"
  add_foreign_key "projects", "resumes"
  add_foreign_key "resume_skills", "resumes"
  add_foreign_key "resume_skills", "skills"
  add_foreign_key "resumes", "users"
  add_foreign_key "reviews", "employers"
  add_foreign_key "reviews", "users"
  add_foreign_key "work_experiences", "resumes"
end

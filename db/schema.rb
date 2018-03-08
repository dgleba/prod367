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

ActiveRecord::Schema.define(version: 50161230223319) do

  create_table "copy_morning_meetings_2018-03-08", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "priority"
    t.string   "machine_id"
    t.text     "problem_description",    limit: 65535
    t.string   "running"
    t.string   "responsibility"
    t.text     "timing_plan_for_repair", limit: 65535
    t.text     "followup_comments",      limit: 65535
    t.string   "is_closed",                            default: "no"
    t.string   "name_off"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "reviewed_mark"
  end

  create_table "dataface__failed_logins", primary_key: "attempt_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ip_address",      limit: 32, null: false
    t.string  "username",        limit: 32, null: false
    t.integer "time_of_attempt",            null: false
  end

  create_table "dataface__modules", primary_key: "module_name", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "module_version"
  end

  create_table "dataface__mtimes", primary_key: "name", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "mtime"
  end

  create_table "dataface__preferences", primary_key: "pref_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username",  limit: 64,  null: false
    t.string "table",     limit: 128, null: false
    t.string "record_id",             null: false
    t.string "key",       limit: 128, null: false
    t.string "value",                 null: false
    t.index ["record_id"], name: "record_id", using: :btree
    t.index ["table"], name: "table", using: :btree
    t.index ["username"], name: "username", using: :btree
  end

  create_table "dataface__record_mtimes", primary_key: "recordhash", id: :string, limit: 32, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "recordid", null: false
    t.integer "mtime",    null: false
  end

  create_table "dataface__version", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "morning_meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "priority"
    t.string   "machine_id"
    t.text     "problem_description",    limit: 65535
    t.string   "running"
    t.string   "responsibility"
    t.text     "timing_plan_for_repair", limit: 65535
    t.text     "followup_comments",      limit: 65535
    t.string   "is_closed",                            default: "no"
    t.string   "name_off",               limit: 99
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "reviewed_mark"
  end

  create_table "morning_meetings__history", primary_key: "history__id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "history__language",      limit: 2
    t.text     "history__comments",      limit: 65535
    t.string   "history__user",          limit: 32
    t.integer  "history__state",                       default: 0
    t.datetime "history__modified"
    t.integer  "id"
    t.string   "name"
    t.string   "priority"
    t.string   "machine_id"
    t.text     "problem_description",    limit: 65535
    t.string   "running"
    t.string   "responsibility"
    t.text     "timing_plan_for_repair", limit: 65535
    t.text     "followup_comments",      limit: 65535
    t.string   "is_closed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["history__modified"], name: "datekeys", using: :btree
    t.index ["id"], name: "prikeys", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "active_status"
    t.integer  "sort"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "name"
    t.integer  "role_id",                     default: 1
    t.integer  "auditor_inMSaccess_reporter"
    t.index ["auditor_inMSaccess_reporter"], name: "index_users_on_auditor_inMSaccess_reporter", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  create_table "users_xataface_prod367", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "role_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "encrypted_password",                 default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "Role",                   limit: 9,   default: "NO", null: false
    t.string   "username",               limit: 234, default: "x",  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  create_table "version_associations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
    t.index ["version_id"], name: "index_version_associations_on_version_id", using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 4294967295
    t.datetime "created_at"
    t.text     "object_changes", limit: 4294967295
    t.integer  "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
    t.index ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree
  end

end

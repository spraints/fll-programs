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

ActiveRecord::Schema.define(version: 20161117135339) do

  create_table "file_contents", force: :cascade do |t|
    t.string   "sha1",       limit: 40
    t.binary   "content"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["sha1"], name: "index_file_contents_on_sha1", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "slug"], name: "index_projects_on_owner_id_and_slug", unique: true
    t.index ["owner_id"], name: "index_projects_on_owner_id"
  end

  create_table "tree_entries", force: :cascade do |t|
    t.integer  "version_id"
    t.integer  "file_content_id"
    t.string   "path"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["file_content_id"], name: "index_tree_entries_on_file_content_id"
    t.index ["version_id", "path"], name: "index_tree_entries_on_version_id_and_path", unique: true
    t.index ["version_id"], name: "index_tree_entries_on_version_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "parent_version_id"
    t.integer  "committer_id"
    t.string   "comment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["committer_id"], name: "index_versions_on_committer_id"
    t.index ["parent_version_id"], name: "index_versions_on_parent_version_id"
    t.index ["project_id"], name: "index_versions_on_project_id"
  end

end

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

ActiveRecord::Schema.define(version: 20161008132120) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rater_id", "rateable_id"], name: "index_average_caches_on_rater_id_and_rateable_id"
  end

  create_table "campeurs", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "gender"
    t.string   "adresse"
    t.string   "ville"
    t.string   "cp"
    t.string   "surname"
    t.integer  "telephone"
    t.date     "birthday"
    t.text     "description"
    t.string   "fonction"
    t.boolean  "verified"
    t.index ["email"], name: "index_campeurs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_campeurs_on_reset_password_token", unique: true
  end

  create_table "campings", force: :cascade do |t|
    t.string   "name"
    t.string   "adresse"
    t.string   "code_postale"
    t.string   "commune"
    t.string   "courriel"
    t.string   "site_internet"
    t.string   "tel"
    t.text     "description"
    t.string   "nomdep"
    t.string   "nomregion"
    t.string   "numdep"
    t.string   "slug"
    t.integer  "ville_id"
    t.integer  "region_id"
    t.integer  "departement_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "etoile"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image"
    t.integer  "emplacement"
    t.integer  "proprietaire_id"
    t.integer  "caracteristiquetest_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "adressecomplete"
    t.string   "piscine"
    t.string   "barbecue"
    t.string   "youtube_url"
  end

  create_table "caracteristiquetests", force: :cascade do |t|
    t.string   "piscine"
    t.string   "barbecue"
    t.integer  "camping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "handicap"
    t.string   "animaux"
    t.string   "television"
  end

  create_table "departements", force: :cascade do |t|
    t.text     "description"
    t.string   "nomdep"
    t.integer  "departement_id"
    t.string   "slug"
    t.integer  "region_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_overall_averages_on_rateable_id_and_rateable_type"
  end

  create_table "proprietaires", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "gender"
    t.string   "adresse"
    t.string   "ville"
    t.string   "cp"
    t.string   "surname"
    t.integer  "telephone"
    t.date     "birthday"
    t.text     "description"
    t.string   "fonction"
    t.boolean  "verified"
    t.index ["email"], name: "index_proprietaires_on_email", unique: true
    t.index ["reset_password_token"], name: "index_proprietaires_on_reset_password_token", unique: true
  end

  create_table "proprietaires_roles", id: false, force: :cascade do |t|
    t.integer "proprietaire_id"
    t.integer "role_id"
    t.index ["proprietaire_id", "role_id"], name: "index_proprietaires_roles_on_proprietaire_id_and_role_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
  end

  create_table "regions", force: :cascade do |t|
    t.text     "descriptionregion"
    t.string   "nomderegion"
    t.string   "slug"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "situations", force: :cascade do |t|
    t.string   "plage"
    t.float    "distanceplage"
    t.string   "etang"
    t.float    "distanceetang"
    t.string   "lac"
    t.float    "distancelac"
    t.string   "riviere"
    t.float    "distanceriviere"
    t.string   "baseloisir"
    t.float    "distancebaseloisir"
    t.string   "foret"
    t.float    "distanceforet"
    t.string   "parcnaturel"
    t.float    "distanceparcnaturel"
    t.string   "montagne"
    t.float    "distancemontagne"
    t.string   "sporthiver"
    t.float    "distancesporthiver"
    t.integer  "camping_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "villes", force: :cascade do |t|
    t.text     "nomcommune"
    t.text     "description"
    t.string   "nomdep"
    t.integer  "departement_id"
    t.integer  "code_postale"
    t.text     "region"
    t.integer  "region_id"
    t.text     "slug"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end

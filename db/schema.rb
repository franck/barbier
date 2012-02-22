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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120222144419) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.date     "birthdate"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "salon_id"
  end

  create_table "facebook_accounts", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.string   "picture"
    t.string   "access_token"
    t.string   "page_access_token"
    t.string   "page_name"
    t.string   "page_identifier"
    t.string   "page_picture"
    t.integer  "salon_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "salon_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "publish_on_facebook_account"
    t.datetime "published_on_facebook_account_at"
    t.boolean  "publish_on_facebook_page"
    t.datetime "published_on_facebook_page_at"
    t.datetime "published_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "salon_id"
    t.string   "picture_file_name"
    t.integer  "picture_file_size"
    t.string   "picture_content_type"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "salons", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "domain"
    t.string   "encrypted_password"
    t.string   "public_email"
    t.string   "phone"
    t.string   "address"
    t.string   "postalcode"
    t.string   "city"
    t.string   "title"
    t.text     "description"
  end

  create_table "tarifs", :force => true do |t|
    t.string   "title"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.integer  "salon_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "themes", :force => true do |t|
    t.text     "html"
    t.text     "css"
    t.string   "title"
    t.string   "state"
    t.integer  "salon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

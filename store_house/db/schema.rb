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

ActiveRecord::Schema.define(:version => 20160130235843) do

  create_table "addresses", :force => true do |t|
    t.string  "via_type",         :limit => 20
    t.string  "via",              :limit => 60
    t.string  "number",           :limit => 10
    t.string  "floor",            :limit => 10
    t.string  "stair",            :limit => 10
    t.string  "town",             :limit => 30
    t.string  "city",             :limit => 30
    t.string  "post_code",        :limit => 5
    t.integer "addressable_id"
    t.string  "addressable_type"
  end

  create_table "articles", :force => true do |t|
    t.string   "code",        :limit => 4,   :null => false
    t.string   "description", :limit => 150, :null => false
    t.date     "voided_at"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "price_id"
  end

  create_table "businesses", :force => true do |t|
    t.string "name"
    t.string "company"
    t.string "tax_number", :limit => 9
    t.string "email"
    t.string "telephone"
    t.string "mobile"
  end

  create_table "costs", :force => true do |t|
    t.decimal  "raw_material", :precision => 5, :scale => 2
    t.decimal  "confection",   :precision => 5, :scale => 2
    t.decimal  "supplement",   :precision => 5, :scale => 2
    t.decimal  "supply",       :precision => 5, :scale => 2
    t.decimal  "cost_price",   :precision => 5, :scale => 2
    t.integer  "article_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "costs", ["article_id"], :name => "index_costs_on_article_id"

  create_table "customers", :force => true do |t|
    t.string  "name"
    t.string  "company"
    t.string  "tax_number",     :limit => 9
    t.boolean "re_income",                   :default => false
    t.string  "email"
    t.string  "telephone"
    t.string  "mobile"
    t.string  "contact_person"
    t.string  "notes"
  end

  create_table "orders", :force => true do |t|
    t.integer  "order_number",                                                :null => false
    t.date     "date",                                                        :null => false
    t.decimal  "discount",     :precision => 5, :scale => 2, :default => 0.0
    t.date     "deliver_date"
    t.date     "voided_at"
    t.integer  "customer_id"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "orders_line_items", :force => true do |t|
    t.string  "colour"
    t.integer "size"
    t.decimal "price",      :precision => 5, :scale => 2
    t.integer "order_id"
    t.integer "article_id"
  end

  add_index "orders_line_items", ["article_id"], :name => "index_orders_line_items_on_article_id"
  add_index "orders_line_items", ["order_id"], :name => "index_orders_line_items_on_order_id"

  create_table "prices", :force => true do |t|
    t.date     "date_from",  :default => '2016-01-31'
    t.date     "date_to"
    t.integer  "article_id"
    t.integer  "cost_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "stocks", :force => true do |t|
    t.string   "colour"
    t.string   "size"
    t.integer  "quantity"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stocks", ["article_id"], :name => "index_stocks_on_article_id"

end

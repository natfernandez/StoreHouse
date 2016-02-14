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

ActiveRecord::Schema.define(:version => 20160207203750) do

  create_table "addresses", :force => true do |t|
    t.string  "line_1",           :limit => 50
    t.string  "line_2",           :limit => 50
    t.string  "line_3",           :limit => 50
    t.string  "line_4",           :limit => 50
    t.string  "post_code",        :limit => 5
    t.string  "country",          :limit => 80
    t.integer "addressable_id"
    t.string  "addressable_type"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], :name => "index_addresses_on_addressable_id_and_addressable_type", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "code",        :limit => 4,   :null => false
    t.string   "description", :limit => 150, :null => false
    t.date     "voided_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "business_data", :force => true do |t|
    t.string "name",                    :null => false
    t.string "company"
    t.string "tax_number", :limit => 9
    t.string "email"
    t.string "telephone"
    t.string "mobile"
  end

  create_table "colours", :force => true do |t|
    t.string "description"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name",                                                                         :null => false
    t.string   "company"
    t.string   "tax_number",     :limit => 9
    t.boolean  "re_income",                                                 :default => false
    t.string   "email"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "contact_person"
    t.string   "notes"
    t.decimal  "risk",                        :precision => 5, :scale => 2
    t.datetime "deleted_at"
  end

  create_table "costs", :force => true do |t|
    t.integer  "article_id"
    t.decimal  "raw_material", :precision => 5, :scale => 2
    t.decimal  "confection",   :precision => 5, :scale => 2
    t.decimal  "supplement",   :precision => 5, :scale => 2
    t.decimal  "supply",       :precision => 5, :scale => 2
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "costs", ["article_id"], :name => "index_costs_on_article_id"

  create_table "order_line_items", :force => true do |t|
    t.integer "order_id"
    t.integer "article_id",                               :null => false
    t.string  "colour"
    t.integer "size"
    t.integer "quantity"
    t.decimal "price",      :precision => 5, :scale => 2
  end

  add_index "order_line_items", ["article_id"], :name => "index_order_line_items_on_article_id"
  add_index "order_line_items", ["order_id"], :name => "index_order_line_items_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "order_number",                                                :null => false
    t.integer  "contact_id",                                                  :null => false
    t.date     "date",                                                        :null => false
    t.decimal  "discount",     :precision => 5, :scale => 2, :default => 0.0
    t.date     "deliver_date"
    t.date     "voided_at"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  add_index "orders", ["contact_id"], :name => "index_orders_on_contact_id"
  add_index "orders", ["order_number"], :name => "index_orders_on_order_number"

  create_table "prices", :force => true do |t|
    t.date     "date_from",                                    :default => '2016-02-14'
    t.date     "date_to"
    t.decimal  "amount",         :precision => 5, :scale => 2
    t.integer  "priceable_id"
    t.string   "priceable_type"
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
  end

  add_index "prices", ["priceable_id", "priceable_type"], :name => "index_prices_on_priceable_id_and_priceable_type", :unique => true

  create_table "sizes", :force => true do |t|
    t.string "description"
    t.string "type",        :limit => 15, :null => false
  end

  create_table "stocks", :force => true do |t|
    t.integer  "article_id"
    t.integer  "colour_id"
    t.integer  "size_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stocks", ["article_id", "colour_id", "size_id"], :name => "index_stocks_on_article_id_and_colour_id_and_size_id"

end

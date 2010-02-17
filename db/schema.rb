# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091029185346) do

  create_table "giftlists", :force => true do |t|
    t.integer  "user_id",                                  :null => false
    t.string   "giftlist_name", :default => "My Giftlist"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "hidden"
  end

  create_table "gifts", :force => true do |t|
    t.integer  "user_id",                                     :null => false
    t.integer  "giftlist_id",                                 :null => false
    t.decimal  "price",         :precision => 8, :scale => 2
    t.string   "url"
    t.text     "description"
    t.integer  "num_purchased"
    t.integer  "num_requested"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "ranking"
  end

  create_table "measurements", :force => true do |t|
    t.integer  "user_id"
    t.string   "tshirt_size"
    t.integer  "waist"
    t.integer  "inseam"
    t.integer  "shoe_size"
    t.integer  "hat_size"
    t.string   "dress_shirt_size"
    t.string   "bust_size"
    t.integer  "dress_size"
    t.integer  "hip_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "hashed_password", :null => false
    t.string   "email_addr",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end

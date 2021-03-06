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

ActiveRecord::Schema.define(version: 6) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'brews', force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.bigint 'coffee_id', null: false
    t.string 'equipment'
    t.string 'method'
    t.integer 'coffee_weight'
    t.integer 'water_weight'
    t.string 'grinder'
    t.string 'grinder_setting'
    t.integer 'time'
    t.text 'notes'
    t.integer 'rating'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['coffee_id'], name: 'index_brews_on_coffee_id'
    t.index ['user_id'], name: 'index_brews_on_user_id'
  end

  create_table 'coffees', force: :cascade do |t|
    t.bigint 'roaster_id', null: false
    t.string 'name'
    t.string 'country'
    t.string 'region'
    t.string 'town'
    t.decimal 'lat', precision: 10, scale: 6
    t.decimal 'lng', precision: 10, scale: 6
    t.string 'process'
    t.integer 'altitude'
    t.string 'variety'
    t.string 'tasting_notes'
    t.string 'producer'
    t.text 'description'
    t.string 'url', null: false
    t.boolean 'available'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[roaster_id name], name: 'index_coffees_on_roaster_id_and_name', unique: true
    t.index ['roaster_id'], name: 'index_coffees_on_roaster_id'
    t.index ['url'], name: 'index_coffees_on_url', unique: true
  end

  create_table 'favourites', force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.bigint 'coffee_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['coffee_id'], name: 'index_favourites_on_coffee_id'
    t.index ['user_id'], name: 'index_favourites_on_user_id'
  end

  create_table 'inventories', force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.bigint 'coffee_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['coffee_id'], name: 'index_inventories_on_coffee_id'
    t.index ['user_id'], name: 'index_inventories_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.bigint 'coffee_id', null: false
    t.integer 'rating'
    t.text 'content'
    t.boolean 'public'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['coffee_id'], name: 'index_reviews_on_coffee_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'roasters', force: :cascade do |t|
    t.string 'reference'
    t.string 'name'
    t.text 'description'
    t.string 'location'
    t.decimal 'lat', precision: 10, scale: 6
    t.decimal 'lng', precision: 10, scale: 6
    t.string 'website'
    t.string 'twitter'
    t.string 'instagram'
    t.string 'facebook'
    t.datetime 'last_coffee_fetch', precision: 6
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['reference'], name: 'index_roasters_on_reference', unique: true
    t.index ['website'], name: 'index_roasters_on_website', unique: true
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at', precision: 6
    t.datetime 'remember_created_at', precision: 6
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at', precision: 6
    t.datetime 'last_sign_in_at', precision: 6
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at', precision: 6
    t.datetime 'confirmation_sent_at', precision: 6
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at', precision: 6
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'username', default: ''
    t.boolean 'terms', default: false
    t.boolean 'subscription_interest', default: false
    t.boolean 'admin', default: false
    t.string 'address_ship_street'
    t.string 'address_ship_area'
    t.string 'address_ship_city'
    t.string 'address_ship_county'
    t.string 'address_ship_postcode'
    t.string 'address_ship_phone'
    t.string 'address_bill_street'
    t.string 'address_bill_area'
    t.string 'address_bill_city'
    t.string 'address_bill_county'
    t.string 'address_bill_postcode'
    t.string 'address_bill_phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  add_foreign_key 'brews', 'coffees'
  add_foreign_key 'brews', 'users'
  add_foreign_key 'coffees', 'roasters'
  add_foreign_key 'favourites', 'coffees'
  add_foreign_key 'favourites', 'users'
  add_foreign_key 'inventories', 'coffees'
  add_foreign_key 'inventories', 'users'
  add_foreign_key 'reviews', 'coffees'
  add_foreign_key 'reviews', 'users'
end

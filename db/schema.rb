# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_413_110_000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'answers', force: :cascade do |t|
    t.text 'body', null: false
    t.boolean 'correct', default: false
    t.integer 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'badges', force: :cascade do |t|
    t.text 'name', null: false
    t.text 'url', null: false
    t.text 'rule', null: false
    t.text 'rule_value'
  end

  create_table 'badges_users', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'badge_id', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_categories_on_title', unique: true
  end

  create_table 'feedbacks', force: :cascade do |t|
    t.text 'body', null: false
    t.integer 'user_id', null: false
  end

  create_table 'gists', force: :cascade do |t|
    t.integer 'question_id'
    t.integer 'user_id'
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'body', null: false
    t.integer 'test_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['test_id'], name: 'index_questions_on_test_id'
  end

  create_table 'test_passages', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'test_id'
    t.integer 'question_id'
    t.integer 'correctly_answered', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_test_passages_on_question_id'
    t.index ['test_id'], name: 'index_test_passages_on_test_id'
    t.index ['user_id'], name: 'index_test_passages_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'level', default: 0, null: false
    t.integer 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'author_id', null: false
    t.index ['author_id'], name: 'index_tests_on_author_id'
    t.index ['category_id'], name: 'index_tests_on_category_id'
    t.index %w[title level], name: 'index_tests_on_title_and_level', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'type', default: 'User', null: false
    t.string 'firstname'
    t.string 'lastname'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['type'], name: 'index_users_on_type'
  end
end

# frozen_string_literal: true

class Migration < ActiveRecord::Migration[5.2]
  create_table 'answers', force: :cascade do |t|
    t.text 'body', null: false
    t.boolean 'correct', default: false
    t.integer 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_categories_on_title', unique: true
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

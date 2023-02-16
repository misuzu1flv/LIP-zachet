# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_206_180_443) do
  create_table 'questions', force: :cascade do |t|
    t.string 'question'
    t.string 'answer'
    t.integer 'test_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['test_id'], name: 'index_questions_on_test_id'
  end

  create_table 'results', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.integer 'question_id'
    t.string 'result_value'
    t.index ['question_id'], name: 'index_results_on_question_id'
    t.index ['user_id'], name: 'index_results_on_user_id'
  end

  create_table 'test_completions', force: :cascade do |t|
    t.integer 'score'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.integer 'test_id'
    t.index ['test_id'], name: 'index_test_completions_on_test_id'
    t.index ['user_id'], name: 'index_test_completions_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'data'
    t.integer 'user_id'
    t.index ['user_id'], name: 'index_tests_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'admin'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'results', 'questions'
  add_foreign_key 'results', 'users'
  add_foreign_key 'test_completions', 'tests'
  add_foreign_key 'test_completions', 'users'
  add_foreign_key 'tests', 'users'
end

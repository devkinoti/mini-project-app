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

ActiveRecord::Schema[7.0].define(version: 20_221_103_143_044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pg_stat_statements'
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'accounts', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_accounts_on_user_id'
  end

  create_table 'activities', force: :cascade do |t|
    t.string 'trackable_type'
    t.uuid 'trackable_id'
    t.string 'owner_type'
    t.uuid 'owner_id'
    t.string 'key'
    t.text 'parameters'
    t.string 'recipient_type'
    t.uuid 'recipient_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[owner_id owner_type], name: 'index_activities_on_owner_id_and_owner_type'
    t.index %w[owner_type owner_id], name: 'index_activities_on_owner'
    t.index %w[recipient_id recipient_type], name: 'index_activities_on_recipient_id_and_recipient_type'
    t.index %w[recipient_type recipient_id], name: 'index_activities_on_recipient'
    t.index %w[trackable_id trackable_type], name: 'index_activities_on_trackable_id_and_trackable_type'
    t.index %w[trackable_type trackable_id], name: 'index_activities_on_trackable'
  end

  create_table 'projects', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.text 'project_name', null: false, comment: 'The name of the project'
    t.text 'description', null: false, comment: 'Project Description'
    t.text 'project_number', null: false,
                             comment: "The project's display number within the system.This number is auto generated in app/services/project_creator"
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'account_id', null: false
    t.index ['account_id'], name: 'index_projects_on_account_id'
    t.index ['user_id'], name: 'index_projects_on_user_id'
  end

  create_table 'tasks', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'project_id', null: false
    t.string 'name'
    t.text 'description'
    t.datetime 'end_date'
    t.datetime 'start_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'account_id', null: false
    t.string 'status'
    t.index ['account_id'], name: 'index_tasks_on_account_id'
    t.index ['project_id'], name: 'index_tasks_on_project_id'
  end

  create_table 'tasks_team_members', force: :cascade do |t|
    t.uuid 'task_id'
    t.uuid 'team_member_id'
    t.index ['task_id'], name: 'index_tasks_team_members_on_task_id'
    t.index ['team_member_id'], name: 'index_tasks_team_members_on_team_member_id'
  end

  create_table 'team_members', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'email', default: '', null: false
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
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'account_id', null: false
    t.boolean 'terms_agreement', default: false, null: false
    t.index ['account_id'], name: 'index_team_members_on_account_id'
    t.index ['confirmation_token'], name: 'index_team_members_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_team_members_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_team_members_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_team_members_on_unlock_token', unique: true
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'email', default: '', null: false
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
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'terms_agreement', default: false, null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  add_foreign_key 'accounts', 'users'
  add_foreign_key 'projects', 'accounts'
  add_foreign_key 'projects', 'users'
  add_foreign_key 'tasks', 'accounts'
  add_foreign_key 'tasks', 'projects'
  add_foreign_key 'team_members', 'accounts'
end

# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_211_118_103_658) do
  enable_extension 'plpgsql'

  create_table 'lists', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.integer 'state', default: 0
    t.index ['user_id'], name: 'index_lists_on_user_id'
  end

  create_table 'to_dos', force: :cascade do |t|
    t.string 'task'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'state', default: 0
    t.bigint 'list_id'
    t.date 'scheduled_date'
    t.index ['list_id'], name: 'index_to_dos_on_list_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'api_key'
  end
end

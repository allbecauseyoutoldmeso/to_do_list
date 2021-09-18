# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_210_918_182_425) do
  enable_extension 'plpgsql'

  create_table 'to_dos', force: :cascade do |t|
    t.string 'task'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'state', default: 0
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end

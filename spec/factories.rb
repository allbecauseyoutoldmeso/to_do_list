# frozen_string_literal: true

FactoryBot.define do
  factory :to_do do
    task { 'Buy socks' }
  end

  factory :user do
    email { 'jane.smith@example.com' }
    password { 'password' }
  end
end

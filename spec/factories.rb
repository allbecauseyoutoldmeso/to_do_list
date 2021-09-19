# frozen_string_literal: true

FactoryBot.define do
  factory :to_do do
    task { 'Buy socks' }
    list factory: :list
  end

  factory :user do
    email { 'jane.smith@example.com' }
    password { 'password' }

    after(:create) do |user|
      create(:list, user: user, name: 'ToDos', primary: true)
    end
  end

  factory :session do
    transient do
      user { create(:user) }
    end

    email { user.email }
    password { user.password }
  end

  factory :list do
    name { 'shopping' }
    user factory: :user
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :to_do do
    task { Faker::Lorem.sentence(word_count: 3) }
    list factory: :list
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :session do
    transient do
      user { create(:user) }
    end

    email { user.email }
    password { user.password }
  end

  factory :list do
    name { Faker::Lorem.word }
    user factory: :user
  end
end

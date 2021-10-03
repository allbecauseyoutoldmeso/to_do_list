# frozen_string_literal: true

FactoryBot.define do
  factory :archive_done do
    transient do
      list { create(:list) }
    end

    initialize_with { new(list) }
  end

  factory :list do
    name { Faker::Lorem.word }
    user factory: :user
  end

  factory :list_email do
    transient do
      list { create(:list) }
    end

    initialize_with { new(list) }
  end

  factory :scheduled_to_do do
    transient do
      list { create(:list) }
      to_do { list.to_dos.new }
    end

    initialize_with { new(to_do) }
    task { Faker::Lorem.sentence(word_count: 3) }
    scheduled_date { 1.week.from_now }
  end

  factory :session do
    transient do
      user { create(:user) }
    end

    email { user.email }
    password { user.password }
  end

  factory :to_do do
    task { Faker::Lorem.sentence(word_count: 3) }
    list factory: :list
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

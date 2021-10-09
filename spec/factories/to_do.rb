# frozen_string_literal: true

FactoryBot.define do
  factory :to_do do
    task { Faker::Lorem.sentence(word_count: 3) }
    list factory: :list

    trait :scheduled do
      state { ToDo.states[:scheduled] }
      scheduled_date { Date.tomorrow }
    end
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Lorem.word }
    user factory: :user
  end
end

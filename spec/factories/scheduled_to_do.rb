# frozen_string_literal: true

FactoryBot.define do
  factory :scheduled_to_do do
    transient do
      list { create(:list) }
      to_do { list.to_dos.new }
    end

    initialize_with { new(to_do) }

    task { Faker::Lorem.sentence(word_count: 3) }
    scheduled_date { 1.week.from_now }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :convert_to_scheduled do
    transient do
      to_do { create(:to_do) }
    end

    initialize_with { new(to_do) }

    scheduled_date { Date.tomorrow }
  end
end

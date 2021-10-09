# frozen_string_literal: true

FactoryBot.define do
  factory :convert_from_scheduled do
    transient do
      to_do { create(:to_do, :scheduled) }
    end

    initialize_with { new(to_do) }
  end
end

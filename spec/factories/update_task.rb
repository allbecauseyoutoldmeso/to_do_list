# frozen_string_literal: true

FactoryBot.define do
  factory :update_task do
    transient do
      to_do { create(:to_do) }
    end

    initialize_with { new(to_do) }
  end
end

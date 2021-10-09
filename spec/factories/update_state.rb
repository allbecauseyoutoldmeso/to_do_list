# frozen_string_literal: true

FactoryBot.define do
  factory :update_state do
    transient do
      to_do { create(:to_do, :scheduled) }
    end

    initialize_with { new(to_do) }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :list_email do
    transient do
      list { create(:list) }
    end

    initialize_with { new(list) }
  end
end

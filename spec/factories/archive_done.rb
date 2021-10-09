# frozen_string_literal: true

FactoryBot.define do
  factory :archive_done do
    transient do
      list { create(:list) }
    end

    initialize_with { new(list) }
  end
end

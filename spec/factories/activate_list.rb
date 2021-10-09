# frozen_string_literal: true

FactoryBot.define do
  factory :activate_list do
    transient do
      list { create(:list) }
    end

    initialize_with { new(list) }
  end
end

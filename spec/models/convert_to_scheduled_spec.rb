# frozen_string_literal: true

require 'rails_helper'

describe ConvertToScheduled do
  it_behaves_like 'schedulable' do
    let(:presenter) { build(:convert_to_scheduled) }
  end

  it_behaves_like 'presentable' do
    let(:scheduled_date) { 1.week.from_now.to_date }

    let(:presenter) do
      build(:convert_to_scheduled, scheduled_date: scheduled_date)
    end

    let(:expected_attributes) do
      { state: 'scheduled', scheduled_date: scheduled_date }
    end
  end
end
